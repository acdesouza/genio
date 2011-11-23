class WishesController < ApplicationController
  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new params[:wish]
    if @wish.save
      redirect_to :action => 'index'
    else
      render action: 'new'
    end
  end

  def index
    @wishes = Wish.find :all
  end

end
