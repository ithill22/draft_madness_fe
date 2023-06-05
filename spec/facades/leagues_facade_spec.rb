require 'rails_helper'

RSpec.describe LeaguesFacade do
  before(:each) do
    league_details = {
        :name=>"League Name", 
        :draft_date=>"June 25, 2023", 
        :draft_time=>"8:30 pm", 
        :manager_id=>2}

    @lf = LeaguesFacade.new.new_league(league_details)
  end
  describe 'new_league' do
    it 'returns a league poro', :vcr do
      expect(@lf).to be_a(League)
      expect(@lf.name).to eq("League Name")
    end
  end
  describe 'league' do
    it 'returns league details', :vcr do
      league = LeaguesFacade.new.league(@lf.id)

      expect(league).to be_a(League)
      expect(league.name).to eq("League Name")
    end
  end
end

RSpec.describe LeaguesFacade do
  describe 'empty_params?' do
    it 'returns true if any params are empty' do
      params

      expect(LeaguesFacade.new.empty_params?(@complete_params)).to be false
      expect(LeaguesFacade.new.empty_params?(@incomplete_params)).to be true
    end
  end
end