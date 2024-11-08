class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_type
      t.string :serial_number
      t.string :customer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
