class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string "name"
      t.text "description"
      t.string "more_info_url"

      t.timestamps
    end
  end
end
