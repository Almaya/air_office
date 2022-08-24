class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :workspace, presence: true

  validate :start_date_cannot_be_in_the_past,
           :end_date_must_be_after_start_date

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, 'cannot be in the past') if start_date < Date.today
  end

  def end_date_must_be_after_start_date
    errors.add(:end_date, 'must be equal to or later than start date') if end_date < start_date
  end
end
