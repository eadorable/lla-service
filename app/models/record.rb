class Record < ApplicationRecord
  belongs_to :user
  belongs_to :device
  validates :ticket_number, :customer_problem, :lla_diagnose, :action, presence: true
  validates :ticket_number, uniqueness: true
end
