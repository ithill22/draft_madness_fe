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
  # describe 'new_user_leagues' do
  #   xit 'creates new user leagues for each participant chosen when creating new league', :vcr do
  #     participants = ['3', '4', '7', '9', '8', '2']
  #     LeaguesFacade.new.new_user_leagues(participants, 3)
  #     # expect all user leagues count to eq 6
  #   end
  # end
end