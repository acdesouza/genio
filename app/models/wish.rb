class Wish < ActiveRecord::Base
  validates :item,
      presence: true
  validates :price,
      presence: true
end
