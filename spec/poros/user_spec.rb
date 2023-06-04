require 'rails_helper'

RSpec.describe User do
  before(:each) do
    data = {:id=>1, 
      :name=>"Alec", 
      :email=>"amkap@gmail.com", 
      :google_id=>"412gfhgf235", 
      :auth_token=>"hjgu734764g34734h347hdf7d7d6"}
    @user = User.new(data)
  end
  describe 'initialize' do
    it 'exists and has attributes' do
      expect(@user).to be_a(User)
      expect(@user.id).to eq(1)
      expect(@user.name).to eq("Alec")
      expect(@user.email).to eq("amkap@gmail.com")
    end
  end
end