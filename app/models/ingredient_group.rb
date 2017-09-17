class IngredientGroup < ApplicationRecord
  acts_as_paranoid
  validates :title, :ingredients, presence: true

  belongs_to :product, :inverse_of => :ingredient_groups
  has_many :ingredients, :inverse_of => :ingredient_group, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :allow_destroy => true

  before_save :default_title

  rails_admin do
    edit do
      field :title
      field :basic
      field :ingredients
    end
  end

  private
  def default_title
    self.title = 'Ingredientes padrão' if basic
  end
end
