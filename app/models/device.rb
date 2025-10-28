class Device < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :device_type, :serial_number, :customer, :fov, presence: true
  validates :serial_number, uniqueness: true

  scope :search, ->(query) {
    # Use left_joins to include devices with or without records
    devices = Device.left_joins(:records).distinct

    # Search in device fields OR in the associated records' ticket_number
    devices.where(
      "devices.serial_number ILIKE :query 
       OR devices.customer ILIKE :query 
       OR devices.device_type ILIKE :query 
       OR records.ticket_number ILIKE :query",
      query: "%#{query}%"
    )
  }

end
