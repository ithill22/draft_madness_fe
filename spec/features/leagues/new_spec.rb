require 'rails_helper'

RSpec.describe 'new league page' do
  before(:each) do
    visit new_league_path
  end
  describe 'As a registered user, when I visit the new league page' do
    it 'has a form to create a league', :vcr do
      user_data
      users = UsersFacade.new.all_users
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return('hjgu.734764g34734h347hdf7d7d6444')
      fill_in :name, with: 'League Name'
      select "2023", from: "[day(1i)]"
      select "June", from: "[day(2i)]"
      select "25", from: "[day(3i)]"
      select "08 PM", from: "[time(4i)]"
      select "30", from: "[time(5i)]"
      users.each do |user|
        within("#user-#{user.id}") do
          expect(page).to have_field(user.id.to_s, type: 'checkbox')
          check(user.id)
        end
      end

      click_button "Submit"
      expect(page).to have_content('League Name')

      # check that user league was made
    end
  end
end