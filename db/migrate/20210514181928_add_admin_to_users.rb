class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :admin, :boolean, default: false
  end
end
