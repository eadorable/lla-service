class Record < ApplicationRecord
  before_validation :sanitize_string_fields

  belongs_to :user
  belongs_to :device
  validates :ticket_number, :customer_problem, :lla_diagnose, :action, :record_date, presence: true
  validates :ticket_number, uniqueness: true

  validate :record_date_cannot_be_in_future

  private

  def record_date_cannot_be_in_future
    if record_date.present? && record_date > Date.today
      errors.add(:record_date, "can't be in the future")
    end
  end

  def sanitize_string_fields
    self.ticket_number = ticket_number.gsub("\0", "") if ticket_number.present?
    self.customer_problem = customer_problem.gsub("\0", "") if customer_problem.present?
    self.lla_diagnose = lla_diagnose.gsub("\0", "") if lla_diagnose.present?
    self.action = action.gsub("\0", "") if action.present?
  end

end
