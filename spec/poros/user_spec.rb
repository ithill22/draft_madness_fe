require 'rails_helper'

RSpec.describe User do
  it 'exists and has attributes' do
    attrs = {
      name: 'Isaac',
      email: 'thill@gmail.com'
    }

    user = User.new(attrs)

    expect(user).to be_a(User)
    expect(user.name).to eq('Isaac')
    expect(user.email).to eq('thill@gmail.com')
  end
end
