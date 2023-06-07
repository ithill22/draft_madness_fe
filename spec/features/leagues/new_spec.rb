require 'rails_helper'

RSpec.describe 'new league page' do
  before(:each) do
    visit new_league_path
  end

  describe 'As a registered user, when I visit the new league page' do
    it 'has a form to create a league', :vcr do
      user_2 = {
        name: 'Bob',
        email: 'bob@turing.edu',
        google_id: '12345',
        auth_token: 'abc123'
      }
      dms = DraftMadnessService.new.register_user(user_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dms[:data][:id])
      users = UsersFacade.new.all_users

      fill_in :name, with: 'League Name'

      select '2023', from: '[day(1i)]'
      select 'June', from: '[day(2i)]'
      select '25', from: '[day(3i)]'
      select '08 PM', from: '[time(4i)]'
      select '30', from: '[time(5i)]'

      users.each do |user|
        within("#user-#{user.id}") do
          expect(page).to have_field(user.id.to_s, type: 'checkbox')
          check(user.name)
        end
      end

      click_button 'Submit'

      expect(page).to have_content('League Name')
    end

    it 'returns an error if form fields are blank', :vcr do
      user_data
      users = UsersFacade.new.all_users
      user1 = users.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return('hjgu.734764g34734h347hdf7d7d6444')

      select '2023', from: '[day(1i)]'
      select 'June', from: '[day(2i)]'
      select '25', from: '[day(3i)]'
      select '08 PM', from: '[time(4i)]'
      select '30', from: '[time(5i)]'
      check(user1.id)

      click_button 'Submit'

      expect(current_path).to eq(new_league_path)
      within('#flash') do
        expect(page).to have_content('Please fill in all fields.')
      end
    end

    it 'returns an error if more or less than 8 participants are selected', :vcr do
      too_many_participants
      users = UsersFacade.new.all_users
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return('hjgu.734764g34734h347hdf7d7d6444')

      fill_in :name, with: 'League Name'
      select '2023', from: '[day(1i)]'
      select 'June', from: '[day(2i)]'
      select '25', from: '[day(3i)]'
      select '08 PM', from: '[time(4i)]'
      select '30', from: '[time(5i)]'

      users.each do |user|
        within("#user-#{user.id}") do
          expect(page).to have_field(user.id.to_s, type: 'checkbox')
          check(user.id)
        end
      end

      click_button 'Submit'

      expect(current_path).to eq(new_league_path)
      within('#flash') do
        expect(page).to have_content('Please choose 8 players.')
      end
    end
  end
end
