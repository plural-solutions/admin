class ProductOrder < ApplicationRecord
  has_many :ingredient_orders
  belongs_to :product
end
