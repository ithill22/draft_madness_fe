class UserLeague
  attr_reader :id,
              :user_id,
              :league_id

  def initialize(roster_data)
    @id = roster_data[:id]
    @user_id = roster_data[:attributes][:user_id]
    @league_id = roster_data[:attributes][:league_id]
  end

  def user_name
    user = User.find(user_id)
    user.name
  end
end