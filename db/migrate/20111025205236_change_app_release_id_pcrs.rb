class ChangeAppReleaseIdPcrs < ActiveRecord::Migration
  def change
    change_table :pcrs do |t|
      t.remove :app_id
      t.column :app_id, :integer
      t.remove :release_id
      t.column :release_id, :integer
    end
  end
end
