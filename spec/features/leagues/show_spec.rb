require 'rails_helper'

RSpec.describe 'Leagues Show Page' do
  describe 'As a visitor, when I visit a leagues show page' do
    before :each do
      visit league_path(1)
    end
    it 'I see the league name', :vcr do
      expect(page).to have_content('League 1')
    end

    it 'I see the rosters for the league', :vcr do
      expect(page).to have_link("Bob's Roster")
      expect(page).to have_link("Sally's Roster")
      expect(page).to have_link("Joe's Roster")
    end
  end
end