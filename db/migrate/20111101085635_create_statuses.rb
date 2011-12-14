class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
