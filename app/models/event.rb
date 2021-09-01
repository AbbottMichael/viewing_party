class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'host_id'
  has_many :attendees, dependent: :destroy

  def find_host_email
    User.find(host_id).email
  end
end
