require 'rails_helper'

RSpec.describe UsersFacade do
  describe 'user' do
    it 'returns a user object', :vcr do
      user_details =
          {
            name: 'Joe',
            email: 'jj@gmail.com',
            google_id: '412gfhgf235',
            auth_token: 'hjgu.734764g34734h347hdf7d7d6g5g5g'
        }
      DraftMadnessService.new.register_user(user_details)
      session_id = 'hjgu.734764g34734h347hdf7d7d6g5g5g'
      facade = UsersFacade.new(session_id)

      expect(facade.user).to be_a(User)
      expect(facade.user_name).to be_a(String)
      expect(facade.user.email).to be_a(String)
    end
  end

  describe 'user_name' do
    it 'returns a user object', :vcr do
      user_details =
          {
            name: 'Joe',
            email: 'jj@gmail.com',
            google_id: '412gfhgf235',
            auth_token: 'hjgu.734764g34734h347hdf7d7d6g5g5g'
        }
      DraftMadnessService.new.register_user(user_details)
      session_id = 'hjgu.734764g34734h347hdf7d7d6g5g5g'
      facade = UsersFacade.new(session_id)


      expect(facade.user_name).to eq('Joe')
    end
  end
end
