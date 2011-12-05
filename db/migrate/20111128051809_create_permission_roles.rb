class CreatePermissionRoles < ActiveRecord::Migration
  def change
    create_table :permissions_roles, :id => false do |t|
        t.integer :permission_id
        t.integer :role_id
    end
  end
end
