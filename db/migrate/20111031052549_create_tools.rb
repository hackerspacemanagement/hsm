class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.date :date_added
      t.date :date_removed
      t.integer :tool_category_id

      t.timestamps
    end
  end
end
