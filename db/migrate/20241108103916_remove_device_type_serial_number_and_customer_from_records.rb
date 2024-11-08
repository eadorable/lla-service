class RemoveDeviceTypeSerialNumberAndCustomerFromRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :device_type, :string
    remove_column :records, :serial_number, :string
    remove_column :records, :customer, :string
  end
end
