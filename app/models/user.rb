class User < ApplicationRecord
  has_many :attendees
  has_many :events
  has_many :followed, foreign_key: :followed_id , class_name: "Friend"
  has_many :followed, through: :followers
  has_many :followers, foreign_key: :follower_id , class_name: "Friend"
  has_many :followers, through: :followed
end
