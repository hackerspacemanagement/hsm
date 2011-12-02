class ToolUniqueIds < ActiveRecord::Migration
  def up
      add_column :tools, :serial_id, :string
  end

  def down
      remove_column :tools, :serial_id
  end
end
