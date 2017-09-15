class Ingredient < ApplicationRecord
  validates :name, :group_name, :price, presence: true
  monetize :price_cents

  belongs_to :product, :inverse_of => :ingredients

  rails_admin do
    edit do
      field :name
      field :group_name
      field :price
      field :basic
    end
  end
end
