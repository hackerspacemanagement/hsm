class ToolExtraColumns < ActiveRecord::Migration
  def change
    add_column :tools, :donatable, :boolean
    add_column :tools, :value,     :string
    add_column :tools, :notes,     :boolean
  end
end
