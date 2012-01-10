class AddMissingColumns < ActiveRecord::Migration
  def change
      add_column :tools, :notes, :string
      add_column :tools, :donatable, :boolean
      add_column :tools, :location, :string
      add_column :tools, :value, :string
  end
end
