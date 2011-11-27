class Updatetoolcategoryids < ActiveRecord::Migration
  def up
      change_column :category, :tool_category_id, :integer
  end

  def down
      change_column :tool_category_id, :category, :string
  end
end
