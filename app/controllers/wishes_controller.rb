class WishesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new params[:wish]
    @wish.user = current_user


    if @wish.save
      redirect_to :action => 'index'
    else
      render action: 'new'
    end
  end

  def index
    @wishes = Wish.grouped
  end

  def user
    @wishes = Wish.find_by_user current_user
  end
end
