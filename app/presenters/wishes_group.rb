class WishesGroup
  def initialize(wish_description)
    @wish_description = wish_description
  end

  def size
    Wish.count(:all, group: 'item', having: {:item => @wish_description})[@wish_description]
  end

end
