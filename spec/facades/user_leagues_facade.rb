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
end