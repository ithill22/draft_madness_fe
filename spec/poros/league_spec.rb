require 'rails_helper'

RSpec.describe League do
  it 'exists and has attributes' do
    attrs = {
      id: '4321',
      attributes: {
        name: 'March Madness',
        draft_time: '12:30',
        draft_date: '2021-08-01',
        manager_id: '1234'
      }
    }

    league = League.new(attrs)

    expect(league).to be_a(League)
    expect(league.id).to eq('4321')
    expect(league.name).to eq('March Madness')
    expect(league.draft_time).to eq('12:30')
    expect(league.draft_date).to eq('2021-08-01')
    expect(league.manager_id).to eq('1234')
  end
end
