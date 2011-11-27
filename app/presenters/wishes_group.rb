class WishesGroup
  attr_reader :wish_description

  def initialize(wish_description)
    @wish_description = wish_description
  end

  def size
    Wish.count(:all, group: 'item', having: {:item => @wish_description})[@wish_description]
  end

  def intervals
    @intervals ||= find_prices_interval
  end


 private
  def find_prices_interval
    prices_interval = [5]
    prices_interval[4] = find_highest_wish_price_for @wish_description
    interval_range = price_interval_range @wish_description
    3.downto 0 do |interval_index|
      prices_interval[interval_index] = prices_interval[interval_index+1] - interval_range
    end

    return prices_interval
  end

  def price_interval_range(wish_description)
    top_price = Wish.where(item: wish_description).maximum('price')
    bottom_price = Wish.where(item: wish_description).minimum('price')
    return (top_price - bottom_price) / 5
  end

  def find_highest_wish_price_for(description)
    Wish.where(item: description).maximum('price')
  end
end
