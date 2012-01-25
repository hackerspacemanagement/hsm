class RolesUsersJoinTable < ActiveRecord::Migration
  def change
      create_table :user_roles do |t|
          t.integer :user_id
          t.integer :role_id
           
          t.timestamp
      end
  end
end
