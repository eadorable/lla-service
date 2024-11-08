class AddDeviceToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :device, null: false, foreign_key: true
  end
end
