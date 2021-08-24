require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'Relationships' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end
end
