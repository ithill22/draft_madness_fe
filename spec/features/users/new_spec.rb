require 'rails_helper'

RSpec.describe 'new user page' do
  describe 'As a visitor, when I visit the new user page' do
    before :each do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        uid: '123545',
        info: {
          name: 'Alec',
          email: 'amk@gmail.com'
        },
        credentials: {
          token: '1244hjgjh54jg333h4kj5l5k6'
        }
      })

      visit new_user_path
    end

    it 'has a link to signup via google oauth', :vcr do
      click_link 'Sign Up With Google'

      expect(current_path).to eq(users_dashboard_path)
    end
  end
end
