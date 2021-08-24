require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Relationships' do
    it { should have_many(:attendees) }
    it { should belong_to(:user) }
  end
end
