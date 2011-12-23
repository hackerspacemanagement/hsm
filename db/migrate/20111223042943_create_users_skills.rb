class CreateUsersSkills < ActiveRecord::Migration
  def change
    create_table :users_skills do |t|
      t.integer "user_id"
      t.integer "skill_id"
      t.integer "proficiency"

      t.timestamps
    end
    
    add_index "users_skills", :user_id
    add_index "users_skills", :skill_id
  end
end
