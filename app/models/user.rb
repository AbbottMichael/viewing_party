class User < ApplicationRecord
  has_many :attendees
  has_many :events, foreign_key: "host_id"
  has_many :followed_users, foreign_key: :followed_id , class_name: "Friend"
  has_many :followed, through: :followed_users
  has_many :following_users, foreign_key: :follower_id , class_name: "Friend"
  has_many :followers, through: :following_users

  validates_confirmation_of :password
  validates :email, uniqueness: true, presence: true, allow_empty: false
  validates_presence_of :password, require: true, allow_empty: false
  validates_presence_of :password_confirmation, require: true, allow_empty: false

  has_secure_password
end
