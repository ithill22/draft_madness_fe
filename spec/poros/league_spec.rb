require 'rails_helper'

RSpec.describe League do
  describe 'initialize' do
    before(:each) do
      data = {
        :id=>1,
        :name=>"League Name", 
        :draft_date=>"June 25, 2023", 
        :draft_time=>"8:30 pm", 
        :manager_id=>2}

      @league = League.new(data)
    end
    it 'exists and has attributes' do
      expect(@league).to be_a(League)
      expect(@league.id).to eq(1)
      expect(@league.name).to eq("League Name")
      expect(@league.draft_date).to eq("June 25, 2023")
      expect(@league.draft_time).to eq("8:30 pm")
      expect(@league.manager_id).to eq(2)
    end
  end
end