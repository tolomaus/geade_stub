class ChangePcrIdToCodePcrs < ActiveRecord::Migration
  def change
    change_table :pcrs do |t|
      t.rename :pcr_id, :code
    end
    change_table :releases do |t|
      t.column :code, :string
    end
    change_table :apps do |t|
      t.column :code, :string
    end
  end
end
