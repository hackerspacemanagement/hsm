class AddToolType < ActiveRecord::Migration
  def up
      change_table :tools do |t|
          t.string :type
      end
  end

  def down
      remove_column :tools, :type
  end
end
