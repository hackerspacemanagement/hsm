class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.integer :user_id
      t.string  :obj_type
      t.string  :obj_id
      t.string  :event

      t.timestamps
    end
  end
end
