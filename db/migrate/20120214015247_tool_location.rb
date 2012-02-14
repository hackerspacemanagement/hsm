class ToolLocation < ActiveRecord::Migration
  def up
    add_column :tools, :location, :string
  end

  def down
    remove_column :tools, :location
  end
end
