class Restaurant < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :products
  has_many :orders
end
