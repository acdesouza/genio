class Bid < ActiveRecord::Base
  validates :price, :due_to, :qtd, :url, :presence => true

  belongs_to :user
end
