class ChangeStatusSeverityPcrs < ActiveRecord::Migration
  def change
    change_table :pcrs do |t|
      t.rename :status, :status_id
      t.rename :severity, :severity_id
      t.change :status_id, :integer
      t.change :severity_id, :integer
    end
  end
end
