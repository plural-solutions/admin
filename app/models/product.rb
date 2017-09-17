class Product < ApplicationRecord
  acts_as_paranoid
  validates :title, :description, :image, :price, presence: true
  monetize :price_cents

  has_many :ingredient_groups, :inverse_of => :product, dependent: :destroy
  accepts_nested_attributes_for :ingredient_groups, :allow_destroy => true
end
