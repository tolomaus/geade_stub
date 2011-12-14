class CreatePcrs < ActiveRecord::Migration
  def change
    create_table :pcrs do |t|
      t.string :pcr_id
      t.string :summary
      t.string :description
      t.string :app_id
      t.string :release_id
      t.string :status
      t.string :severity

      t.timestamps
    end
  end
end
