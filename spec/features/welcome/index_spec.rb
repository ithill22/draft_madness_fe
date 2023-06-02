# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome page' do
  describe 'As a visitor, when I visit the welcome page' do
    before(:each) do
      visit root_path
    end
    it 'I see a button to Sign Up' do
      expect(page).to have_button('Sign Up')
    end
    it 'when I click the button I am taken to the New User page' do
      click_button('Sign Up')
      expect(current_path).to eq(new_user_path)
    end
  end
end
