class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.integer :group_id, null: false
      t.timestamps
    end
    add_index :members, :group_id
    add_index :members, [:name, :group_id], unique: true
  end
end
