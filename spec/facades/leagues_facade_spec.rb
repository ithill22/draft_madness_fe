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
  before(:each) do
    @lf = LeaguesFacade.new
  end
  describe 'empty_params?' do
    it 'returns true if any params are empty' do
      params

      expect(@lf.empty_params?(@complete_params)).to be false
      expect(@lf.empty_params?(@incomplete_params)).to be true
    end
  end
  describe 'eight_players?' do
    it 'returns true if 8 participants were selected' do
      participants_1 = ['1', '2', '3', '4', '5', '6', '7', '8']
      participants_2 = ['1', '2', '3', '4', '5', '6', '7']
      participants_3 = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

      expect(@lf.eight_players?(participants_1)).to be true
      expect(@lf.eight_players?(participants_2)).to be false
      expect(@lf.eight_players?(participants_3)).to be false
    end
  end
end