class AddDeletedAtToProductOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :product_orders, :deleted_at, :datetime
    add_index :product_orders, :deleted_at
  end
end
