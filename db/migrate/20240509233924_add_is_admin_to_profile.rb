class AddIsAdminToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :is_admin, :boolean, default: false
  end
end
