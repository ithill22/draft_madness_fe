require 'rails_helper'

RSpec.describe UsersFacade do
  before(:each) do
    user_data
  end
  describe 'all_users' do
    it 'returns an array of user poros', :vcr do
      uf = UsersFacade.new
      users = uf.all_users
      expect(users).to be_a(Array)
      expect(users).to be_all(User)
    end
  end
end