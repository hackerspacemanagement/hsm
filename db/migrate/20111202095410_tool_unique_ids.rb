class ToolUniqueIds < ActiveRecord::Migration
  def change
      add_column :tools, :serial_id, :string
  end
end
