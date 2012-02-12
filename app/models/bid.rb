class Bid < ActiveRecord::Base
  belongs_to :user

  validates :price, :due_to, :qtd, :url, :user, :presence => true
end
