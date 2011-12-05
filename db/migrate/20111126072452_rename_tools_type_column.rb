class RenameToolsTypeColumn < ActiveRecord::Migration
  def change
    rename_column :tools, :type, :category
  end
end
