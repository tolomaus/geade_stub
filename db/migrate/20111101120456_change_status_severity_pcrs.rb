class ChangeStatusSeverityPcrs < ActiveRecord::Migration
  def change
    change_table :pcrs do |t|
      t.rename :status, :status_id
      t.rename :severity, :severity_id
      t.remove :status_id
      t.column :status_id, :integer
      t.remove :severity_id
      t.column :severity_id, :integer
    end
  end
end
