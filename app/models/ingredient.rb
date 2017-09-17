class Ingredient < ApplicationRecord
  acts_as_paranoid
  validates :name, presence: true
  validate :price_if_not_default

  monetize :price_cents, allow_nil: true

  belongs_to :ingredient_group, :inverse_of => :ingredients

  rails_admin do
    edit do
      field :name
      field :price_cents do
        help 'Coloque o preço em centavos, por exemplo: 1000 significa R$ 10,00'
      end
    end
  end

  private
  def price_if_not_default
    if ingredient_group.basic? && price
      errors.add(:price_cents, 'não defina um preço para um ingrediente padrão')
    end

    if !ingredient_group.basic? && price.nil?
      errors.add(:price_cents, 'defina um preço para um ingrediente padrão')
    end
  end
end
