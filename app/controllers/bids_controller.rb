class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new params[:bid]

    if @bid.save
      redirect_to wishes_path
    end
  end
end
