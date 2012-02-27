class BidsController < ApplicationController
  def new
    @wish_description = params[:wish_id]
    @wishes_group = WishesGroup.new @wish_description

    @bid = Bid.new
  end

  def create
    @bid = Bid.new params[:bid]
    @bid.user = current_user
    @bid.product = Product.find_by_name params[:product_name]

    if @bid.save
      #FIXME O mailer deveria receber uma lista de usuários, não ficar procurando para quem mandar
      price_min, price_max = @bid.price_range
      users = Wish.target_users_in_price_range(@bid.product.name, price_min, price_max)

      BidMailer.delay.bid_created(@bid, users)
      redirect_to wishes_path
    end
  end
end
