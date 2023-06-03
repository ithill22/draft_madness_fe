require 'rails_helper'

RSpec.describe 'User dashboard page' do
  before(:each) do
    visit users_dashboard_path
  end
  describe 'As a registered user, when I visit my dashboard' do
    it 'has a button to create a league' do
      expect(page).to have_button("Create League")
      click_button "Create League"
      expect(current_path).to eq(new_league_path)
    end
  end
end