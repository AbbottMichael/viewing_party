class Friend < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def find_email
    User.find(follower_id).email
  end
end
