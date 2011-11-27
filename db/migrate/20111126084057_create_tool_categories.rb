class CreateToolCategories < ActiveRecord::Migration
  def up
    create_table :tool_categories do |t|
      t.string :name
      t.string :description 

      t.timestamps
    end
  end
  
  def down
    drop_table :tool_categories
  end
end
