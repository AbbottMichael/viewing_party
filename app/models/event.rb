class Event < ApplicationRecord
  belongs_to :user, foreign_key: "host_id"
  has_many :attendees

  def find_host_email
    User.find(self.host_id).email
  end
end
