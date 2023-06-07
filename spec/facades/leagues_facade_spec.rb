require 'rails_helper'

RSpec.describe LeaguesFacade do
  before(:each) do
    league_details = {
      name: 'League Name',
      draft_date: 'June 25, 2023',
      draft_time: '8:30 pm',
      manager_id: 2
    }

    @facade = LeaguesFacade.new.new_league(league_details)
  end

  describe 'new_league' do
    it 'returns a league object', :vcr do
      expect(@facade).to be_a(League)
      expect(@facade.name).to eq('League Name')
    end
  end

  describe 'league' do
    it 'returns league details', :vcr do
      league = LeaguesFacade.new.league(@facade.id)

      expect(league).to be_a(League)
      expect(league.name).to eq('League Name')
    end
  end
end
