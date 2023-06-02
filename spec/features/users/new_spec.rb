require 'rails_helper'

RSpec.describe 'new user page' do
  describe 'As a visitor, when I visit the new user page' do
    it 'has a form to create a new user' do
      visit new_user_path

      
    end
  end
end