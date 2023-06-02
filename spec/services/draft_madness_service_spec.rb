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
  end
end
