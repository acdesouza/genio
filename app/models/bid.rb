class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :price, :due_to, :qtd, :url, :user, :product, :presence => true
end
