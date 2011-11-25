class Wish < ActiveRecord::Base
  validates :item,
      presence: true
  validates :price,
      presence: true

  def self.grouped
    count(:all, group: 'item', order: 'count_all DESC, item ASC')
  end

  def self.price_interval_range(wish_description)
    top_price = where(item: wish_description).maximum('price')
    bottom_price = where(item: wish_description).minimum('price')
    return (top_price - bottom_price) / 5
  end
end
