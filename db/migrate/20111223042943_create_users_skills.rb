class CreateUsersSkills < ActiveRecord::Migration
  def change
    create_table :users_skills do |t|

      t.timestamps
    end
  end
end
