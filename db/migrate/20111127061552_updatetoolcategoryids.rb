class Updatetoolcategoryids < ActiveRecord::Migration
  def up
    change_table :tools do |t|
      t.change :category, :integer
    end
    rename_column :tools, :category, :tool_category_id
  end

  def down
    change_table :tools do |t|
      t.change :category, :string
    end
    rename_column :tools, :tool_category_id, :category
  end
end
