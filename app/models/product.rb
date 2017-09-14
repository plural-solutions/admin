class Product < ApplicationRecord
  validates :title, :description, :image, presence: true
end
