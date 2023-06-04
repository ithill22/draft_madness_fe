require 'rails_helper'

RSpec.describe LeaguesFacade do
  describe 'new_league' do
    it 'returns a league poro', :vcr do
      league_details = {
        :name=>"League Name", 
        :draft_date=>"June 25, 2023", 
        :draft_time=>"8:30 pm", 
        :manager_id=>2}

      lf = LeaguesFacade.new.new_league(league_details)
      expect(lf).to be_a(League)
      expect(lf.name).to eq("League Name")
    end
  end
end