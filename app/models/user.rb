class User < ApplicationRecord
  has_many :attendees
  has_many :events, foreign_key: "host_id"
  has_many :followed_users, foreign_key: :followed_id , class_name: "Friend"
  has_many :followed, through: :followed_users
  has_many :following_users, foreign_key: :follower_id , class_name: "Friend"
  has_many :followers, through: :following_users

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password 
end
