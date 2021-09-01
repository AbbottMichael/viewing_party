class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def find_email
    User.find(self.user_id).email
  end

  def find_event_by_id
    Event.find(self.event_id)
  end
end
