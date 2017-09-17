class ProductOrder < ApplicationRecord
  has_many :ingredient_product_orders
  belongs_to :product
end
