require 'rails_helper'

RSpec.describe UsersFacade do
  describe 'Instance methods' do
    describe 'user' do
      it 'returns a user object', :vcr do
        user_details =
          {
            name: 'Joe',
            email: 'jj@gmail.com',
            google_id: '412gfhgf235',
            auth_token: 'hjgu734764g34734h347hdf7d7d6g5g5g'
          }
        dms = DraftMadnessService.new.register_user(user_details)
        session_id = dms[:data][:id].to_s
        facade = UsersFacade.new(session_id)

        expect(facade.user).to be_a(User)
        expect(facade.user_name).to be_a(String)
        expect(facade.user.email).to be_a(String)
      end
    end

    describe 'user_name' do
      it 'returns a users name', :vcr do
        user_details =
        {
          name: 'Joe',
          email: 'jj@gmail.com',
          google_id: '412gfhgf235',
          auth_token: 'hjgu734764g34734h347hdf7d7d6g5g5g'
        }
        dms = DraftMadnessService.new.register_user(user_details)
        session_id = dms[:data][:id].to_s
        facade = UsersFacade.new(session_id)

        expect(facade.user_name).to eq('Joe')
      end
    end

    describe 'all_leagues_for_user' do
      it 'returns an array of leagues', :vcr do
        session_id = '4'
        facade = UsersFacade.new(session_id)
   
        expect(facade.all_leagues_for_user).to be_an(Array)
        expect(facade.all_leagues_for_user.first).to be_a(League)
        expect(facade.all_leagues_for_user.first.name).to be_a(String)
      end
    end

    describe 'all_users' do
      it 'returns an array of user poros', :vcr do
        user_data
        uf = UsersFacade.new
        users = uf.all_users
        expect(users).to be_a(Array)
        expect(users).to be_all(User)
      end
    end
  end
end
