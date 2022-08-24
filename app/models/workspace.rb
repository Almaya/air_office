class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user, presence: true

end
