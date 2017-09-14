class AddAdminRolesToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :role, :string, default: 'chef'
  end
end
