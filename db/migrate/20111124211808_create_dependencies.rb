class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :child_id
      t.integer :parent_id

      t.timestamps
    end
    add_index :dependencies, :child_id
    add_index :dependencies, :parent_id
    add_index :dependencies, [:child_id, :parent_id], :unique => true
  end
end
