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
      end
    end
  end
end
