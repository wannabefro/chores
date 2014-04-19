class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :groups, :user_id
    add_index :groups, [:name, :user_id], unique: true
  end
end
