require 'rails_helper'

RSpec.describe UserLeague do
  it 'exists and has attributes' do
    attrs = {
      id: '4321',
      attributes: {
        user_id: '1234',
        league_id: '5678'
      }
    }

    user_league = UserLeague.new(attrs)

    expect(user_league).to be_a(UserLeague)
    expect(user_league.id).to eq('4321')
    expect(user_league.user_id).to eq('1234')
    expect(user_league.league_id).to eq('5678')
  end
end
