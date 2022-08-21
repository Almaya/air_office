class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :workspace, presence: true

end
