class CreateUsersSkills < ActiveRecord::Migration
  def change
    create_table :users_skills do |t|
      t.integer "user_id"
      t.integer "skill_id"
      t.integer "proficiency"

      t.timestamps
    end
    
    add_column :users, :skill_id, :integer
  end
end
