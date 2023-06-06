require 'rails_helper'

RSpec.describe DraftMadnessService do
  context 'instance methods' do
    context 'register_user', :vcr do
      it 'returns a user details' do
        user_details =
        {
          name: 'Alec',
          email: 'amkap@gmail.com',
          google_id: '412gfhgf235',
          auth_token: 'hjgu734764g34734h347hdf7d7d6'
        }
        results = DraftMadnessService.new.register_user(user_details)

        expect(results).to be_a(Hash)

        expect(results).to have_key(:data)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)

        user_data = results[:data][:attributes]

        expect(user_data).to have_key(:name)
        expect(user_data).to have_key(:email)
        expect(user_data).to have_key(:google_id)
        expect(user_data).to have_key(:auth_token)

        expect(user_data[:name]).to be_a(String)
        expect(user_data[:email]).to be_a(String)
        expect(user_data[:google_id]).to be_a(String)
        expect(user_data[:auth_token]).to be_a(String)
      end
    end
    
    context 'get_one_user' do
      it 'returns user details', :vcr do
        user_details =
          {
            name: 'Joe',
            email: 'joe@gmail.com',
            google_id: '412gfhgf235',
            auth_token: 'hjgu734764g34734h347hdf7d7d6'
          }
        dms = DraftMadnessService.new.register_user(user_details)
        session_id = dms[:data][:id].to_s

        results = DraftMadnessService.new.get_one_user(session_id)

        expect(results).to be_a(Hash)

        expect(results).to have_key(:data)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)

        user_data = results[:data][:attributes]

        expect(user_data).to have_key(:name)
        expect(user_data).to have_key(:email)
        expect(user_data).to have_key(:google_id)
        expect(user_data).to have_key(:auth_token)

        expect(user_data[:name]).to be_a(String)
        expect(user_data[:email]).to be_a(String)
        expect(user_data[:google_id]).to be_a(String)
        expect(user_data[:auth_token]).to be_a(String)
      end
    end

    context 'all_leagues_for_one_user' do
      it 'returns all leagues for a particular user', :vcr do
        session_id = '2'
        results = DraftMadnessService.new.all_leagues_for_one_user(session_id)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_an(Array)
        expect(results[:data].count).to eq(2)

        results[:data].each do |league|
          expect(league).to have_key(:type)
          expect(league[:type]).to eq('league')

          expect(league).to have_key(:id)
          expect(league[:id]).to be_an(String)

          expect(league).to have_key(:attributes)
          expect(league[:attributes]).to be_a(Hash)

          expect(league[:attributes]).to have_key(:name)
          expect(league[:attributes][:name]).to be_a(String)

          expect(league[:attributes]).to have_key(:draft_time)
          expect(league[:attributes][:draft_time]).to be_a(String)

          expect(league[:attributes]).to have_key(:draft_date)
          expect(league[:attributes][:draft_date]).to be_a(String)

          expect(league[:attributes]).to have_key(:manager_id)
          expect(league[:attributes][:manager_id]).to be_an(Integer)
        end

    context 'get_all_users' do
      it 'returns all user details', :vcr do
        user_data

        results = DraftMadnessService.new.get_all_users

        expect(results).to be_a(Hash)
        users = results[:data]

        users.each do |user|
          expect(user).to have_key(:id)
          expect(user[:attributes]).to have_key(:name)
          expect(user[:attributes]).to have_key(:email)
          expect(user[:attributes]).to have_key(:auth_token)
          expect(user[:attributes]).to have_key(:google_id)
        end
      end
    end
    context 'create_league' do
      it 'returns new league details', :vcr do
        league_details = {
          :name=>"League Name", 
          :draft_date=>"June 25, 2023", 
          :draft_time=>"8:30 pm", 
          :manager_id=>2}
        results = DraftMadnessService.new.create_league(league_details)
      
        expect(results).to be_a(Hash)

        expect(results).to have_key(:data)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)

        user_data = results[:data][:attributes]

        expect(user_data).to have_key(:name)
        expect(user_data).to have_key(:draft_date)
        expect(user_data).to have_key(:draft_time)
        expect(user_data).to have_key(:manager_id)

        expect(user_data[:name]).to be_a(String)
        expect(user_data[:draft_date]).to be_a(String)
        expect(user_data[:draft_time]).to be_a(String)
        expect(user_data[:manager_id]).to be_a(Integer)
      end
    end
    context 'get_one_league' do
      it 'returns details for league with given id', :vcr do
        league_details = {
          :name=>"League Name", 
          :draft_date=>"June 25, 2023", 
          :draft_time=>"8:30 pm", 
          :manager_id=>2}
        service = DraftMadnessService.new
        league = service.create_league(league_details)

        results = service.get_one_league(league.dig(:data, :id))

        expect(results).to be_a(Hash)

        expect(results).to have_key(:data)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)

        league_data = results[:data][:attributes]

        expect(league_data).to have_key(:name)
        expect(league_data).to have_key(:draft_date)
        expect(league_data).to have_key(:draft_time)
        expect(league_data).to have_key(:manager_id)

        expect(league_data[:name]).to be_a(String)
        expect(league_data[:draft_date]).to be_a(String)
        expect(league_data[:draft_time]).to be_a(String)
        expect(league_data[:manager_id]).to be_a(Integer)
      end
    end
    context 'new_user_league' do
      it 'creates a new user league with a given participant id', :vcr do
        user_params = {:name=>"Alec", :email=>"amk@gmail.com", :google_id=>"123345", :auth_token=>"hjgu.734764g34734h347hdf7d7d6444"}
        league_params = {:name=>"League Name", :draft_date=>"June 25, 2023", :draft_time=>"8:30 pm", :manager_id=>2}
      
        @league = DraftMadnessService.new.create_league(league_params)
        @user = DraftMadnessService.new.register_user(user_params)

        ul_details = {
          user_id: @user.dig(:data, :id),
          league_id: @league.dig(:data, :id)
        }
        service = DraftMadnessService.new
        user_league = service.new_user_league(ul_details)

        expect(user_league).to be_a(Hash)

        expect(user_league[:data]).to have_key(:id)
        expect(user_league.dig(:data, :attributes)).to have_key(:user_id)
        expect(user_league.dig(:data, :attributes, :user_id)).to eq(ul_details[:user_id].to_i)
        expect(user_league.dig(:data, :attributes)).to have_key(:league_id)
        expect(user_league.dig(:data, :attributes, :league_id)).to eq(ul_details[:league_id].to_i)
      end
    end
  end
end
