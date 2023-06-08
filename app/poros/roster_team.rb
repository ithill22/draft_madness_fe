class RosterTeam
  attr_reader :id, 
              :user_league_id,
              :api_team_id,
              :score

  def initialize(data)
    @id = data[:id]
    @user_league_id = data[:attributes][:user_league_id]
    @api_team_id = data[:attributes][:api_team_id]
    @score = data[:attributes][:score]
  end
end