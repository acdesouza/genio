class WishesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new params[:wish]
    @wish.user = current_user


    if @wish.save
      redirect_to user_wishes_path(current_user.id)
    else
      render action: 'new'
    end
  end

  def index
    @wishes = Wish.grouped
  end

  def user
    #FIXME Não tem como isso estar certo. Eu tenho q passar um usuário q vai ser ignorado
    @wishes = Wish.find_by_user current_user
  end
end
