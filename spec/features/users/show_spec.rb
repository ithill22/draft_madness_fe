require 'rails_helper'

RSpec.describe 'User Show Page' do
  describe 'As a user, when I visit the user show page,' do
    it 'I see my name welcoming me to my dashboard', :vcr do
      user_2 = {
        name: 'Bob',
        email: 'bob@turing.edu',
        google_id: '12345',
        auth_token: 'abc123'
      }
      dms = DraftMadnessService.new.register_user(user_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dms[:data][:id])
      visit users_dashboard_path

      expect(page).to have_content("Bob's Dashboard")
    end

    it 'I see a section that displays the name of each league I am participating in', :vcr do
      user_2 = {
        name: 'Bob',
        email: 'bob@turing.edu',
        google_id: '12345',
        auth_token: 'abc123'
      }
      dms = DraftMadnessService.new.register_user(user_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dms[:data][:id])
      visit users_dashboard_path

      expect(page).to have_content("Leagues I'm in:")

      within '#league_1' do
        expect(page).to have_content('League 1')
        expect(page).to_not have_content('League 2')
      end

      within '#league_2' do
        expect(page).to have_content('League 2')
        expect(page).to_not have_content('League 1')
      end
    end

    it 'I see that each league name is a link to that leagues show page', :vcr do
      user_2 = {
        name: 'Bob',
        email: 'bob@turing.edu',
        google_id: '12345',
        auth_token: 'abc123'
      }
      dms = DraftMadnessService.new.register_user(user_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dms[:data][:id])
      visit users_dashboard_path

      within '#league_1' do
        expect(page).to have_link('League 1')

        click_link 'League 1'

        expect(current_path).to eq(league_path(1))
      end
    end
  end

  describe 'As a registered user, when I visit my dashboard' do
    it 'has a button to create a league', :vcr do
      visit users_dashboard_path
      expect(page).to have_button("Create League")
      click_button "Create League"
      expect(current_path).to eq(new_league_path)
    end
  end
end

