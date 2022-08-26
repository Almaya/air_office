class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :global_search,
  against: %i[name address neighborhood],
  associated_against: {
    user: %i[first_name last_name username]
  },
  using: {
    tsearch: { prefix: true }
  }

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user, presence: true

end
