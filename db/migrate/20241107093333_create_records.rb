class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date :record_date
      t.string :serial_number
      t.string :ticket_number
      t.string :device_type
      t.text :customer_problem
      t.text :lla_diagnose
      t.text :action

      t.timestamps
    end
  end
end
