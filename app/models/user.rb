class User < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :events, foreign_key: 'host_id', dependent: :destroy
  has_many :followed_users, foreign_key: :followed_id, class_name: 'Friend', dependent: :destroy
  has_many :followed, through: :followed_users
  has_many :following_users, foreign_key: :follower_id, class_name: 'Friend', dependent: :destroy
  has_many :followers, through: :following_users

  validates :password, confirmation: true
  validates :email, uniqueness: true, presence: true, allow_empty: false
  validates :password, presence: { require: true, allow_empty: false }
  validates :password_confirmation, presence: { require: true, allow_empty: false }

  has_secure_password
end
