require 'rails_helper'

RSpec.describe UserLeaguesFacade do 
  describe 'create_user_league' do
    it 'returns the details of a user_league it created', :vcr do
      ul_details = {league_id: 2, user_id: 4}
      ulf = UserLeaguesFacade.new
      ul = ulf.create_user_league(ul_details)
      
      expect(ul).to be_a(Hash)
    end
  end
  describe 'email_user' do
    it 'sends emails to users who were added to the draft', :vcr do
      ulf = UserLeaguesFacade.new
      user_details = {
          name: 'Alec',
          email: 'amkap@gmail.com',
          google_id: '412gfhgf235',
          auth_token: 'hjgu734764g34734h347hdf7d7d6'
        }
      user = DraftMadnessService.new.register_user(user_details)

      expect(ActionMailer::Base.deliveries.count).to eq(0)
      ulf.email_user(user.dig(:data, :id))
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end