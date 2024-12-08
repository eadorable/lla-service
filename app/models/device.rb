class Device < ApplicationRecord
  belongs_to :user
  has_many :records
 # validates :device_type, :serial_number, :customer, presence: true
#  validates :serial_number, uniqueness: true
end
