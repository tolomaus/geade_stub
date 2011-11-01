class CreateSeverities < ActiveRecord::Migration
  def change
    create_table :severities do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
