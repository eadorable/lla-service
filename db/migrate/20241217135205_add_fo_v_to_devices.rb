class AddFoVToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :fov, :float
  end
end
