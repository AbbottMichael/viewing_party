class Event < ApplicationRecord
  belongs_to :user, foreign_key: "host_id"
  has_many :attendees
end
