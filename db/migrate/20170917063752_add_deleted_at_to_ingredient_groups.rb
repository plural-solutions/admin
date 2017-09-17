class AddDeletedAtToIngredientGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredient_groups, :deleted_at, :datetime
    add_index :ingredient_groups, :deleted_at
  end
end
