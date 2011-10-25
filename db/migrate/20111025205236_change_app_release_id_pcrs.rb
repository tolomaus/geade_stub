class ChangeAppReleaseIdPcrs < ActiveRecord::Migration
  def change
    change_table :pcrs do |t|
      t.change :app_id, :integer
      t.change :release_id, :integer
    end
  end
end
