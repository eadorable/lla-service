class Device < ApplicationRecord
  belongs_to :user
  has_many :records

  validates :device_type, :serial_number, :customer, :fov, presence: true
  validates :serial_number, uniqueness: true

  # Scope to search devices by serial_number, customer, device_type, or related record's ticket_number

    scope :search, ->(query) {
    joins(:records).distinct.where(
      "devices.serial_number ILIKE :query 
       OR devices.customer ILIKE :query 
       OR devices.device_type ILIKE :query 
       OR records.ticket_number ILIKE :query",
      query: "%#{query}%"
    )
  }



end
