class Wish < ActiveRecord::Base
  validates :item,
      presence: true
  validates :price,
      presence: true

  def self.grouped
    count(:all, group: 'item', order: 'count_all DESC, item ASC')
  end
end
