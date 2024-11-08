class Record < ApplicationRecord
  belongs_to :user
  belongs_to :device

  validates :serial_number, :ticket_number, :device_type, :customer_problem, :lla_diagnose, :action, :customer, presence: true
  validates :ticket_number, uniqueness: true
  # validates :device_type, inclusion: { in: %w(Laptop Camera Tablet Smartphone) }
  # validates :customer_problem, length: { maximum: 500 }
  # validates :lla_diagnose, :action, length: { maximum: 1000 }


end
