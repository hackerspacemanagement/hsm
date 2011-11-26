class RenameToolsTypeColumn < ActiveRecord::Migration
  def up
    rename_column :tools, :type, :category
  end

  def down
    rename_column :tools, :type, :category
  end
end
