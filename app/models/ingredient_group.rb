class IngredientGroup < ApplicationRecord
  validates :group_name, :ingredients, presence: true

  belongs_to :product, :inverse_of => :ingredient_groups
  has_many :ingredients, :inverse_of => :ingredient_group, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :allow_destroy => true

  before_save :default_group_name

  rails_admin do
    edit do
      field :group_name
      field :basic
      field :ingredients
    end
  end

  private
  def default_group_name
    self.group_name = 'Ingredientes padrão' if basic
  end
end
