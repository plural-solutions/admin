class Product < ApplicationRecord
  validates :title, :description, :image, :price, presence: true
  monetize :price_cents

  has_many :ingredients, :inverse_of => :product, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :allow_destroy => true
end
