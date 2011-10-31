class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :owner_id
      t.string :description
      t.date :date_added
      t.date :date_removed

      t.timestamps
    end
  end
end
