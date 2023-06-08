require 'rails_helper'

RSpec.describe 'Draft Page' do
  before :each do
    visit league_draft_path(3)
  end

  describe 'As a user, when I visit the draft page', :vcr do
    it 'I see the league name' do
  end
end