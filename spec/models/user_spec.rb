require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many(:followed) }
    it { should have_many(:followers) }
    it { should have_many(:events) }
    it { should have_many(:attendees) }
  end
end
