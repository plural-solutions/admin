class Product < ApplicationRecord
  validates :title, :description, :image, :price, presence: true
  monetize :price_cents

  rails_admin do
    show do
      field :title
      field :description
    end
  end
end
