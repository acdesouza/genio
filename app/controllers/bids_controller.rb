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
      redirect_to wishes_path
    end
  end
end
