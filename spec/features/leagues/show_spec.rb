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

    it 'I see a draft button', :vcr do
      visit league_path(3)
      expect(page).to have_button('Enter Draft Room')
    end

    xit 'the draft button is disabled until 30 minutes before draft time', :vcr do
      visit league_path(4)
      expect(page).to have_button('Enter Draft Room', disabled: true)
    end

    it 'If I click the draft button, I am taken to the draft page', :vcr do
      visit league_path(3)
      click_button('Enter Draft Room')
      expect(current_path).to eq(league_draft_path(3))
    end
  end
end