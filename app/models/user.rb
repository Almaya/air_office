class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :workspaces

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w.]+\w+@[\w.]+\.[\w.]+\w{2,}\z/,
    message: "must be a valid email address" }

  validates :password, presence: true, length: { minimum: 6 }
end
