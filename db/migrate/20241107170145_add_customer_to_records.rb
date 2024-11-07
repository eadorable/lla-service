class AddCustomerToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :customer, :string
  end
end
