class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
