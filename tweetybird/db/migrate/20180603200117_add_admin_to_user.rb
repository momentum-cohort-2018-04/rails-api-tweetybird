class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :is_admin, :boolean, default: FALSE, null: false)
  end
end
