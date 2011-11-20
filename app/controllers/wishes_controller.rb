class WishesController < ApplicationController
  def make
  end

  def list
    @wishes = Wish.find :all
  end

end
