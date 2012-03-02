class CreateToolCategories < ActiveRecord::Migration
  def change
    create_table :tool_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
