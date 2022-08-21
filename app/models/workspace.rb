class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user, presence: true

end
