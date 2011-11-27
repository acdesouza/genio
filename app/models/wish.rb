class Wish < ActiveRecord::Base
  validates :item,
      presence: true
  validates :price,
      presence: true

  def self.grouped
    count(:all, group: 'item', order: 'count_all DESC, item ASC')
  end

  def self.find_prices_interval_for_wish(description)
    prices_interval = [5]
    prices_interval[4] = find_highest_wish_price_for description
    interval_range = price_interval_range description
    3.downto 0 do |interval_index|
      prices_interval[interval_index] = prices_interval[interval_index+1] - interval_range
    end

    return prices_interval
  end

 private
  def self.price_interval_range(wish_description)
    top_price = where(item: wish_description).maximum('price')
    bottom_price = where(item: wish_description).minimum('price')
    return (top_price - bottom_price) / 5
  end

  def self.find_highest_wish_price_for(description)
    where(item: description).maximum('price')
  end
end
