class AddDeletedAtToIngredientProductOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredient_product_orders, :deleted_at, :datetime
    add_index :ingredient_product_orders, :deleted_at
  end
end
