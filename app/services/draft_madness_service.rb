class DraftMadnessService
  def register_user(user_details)
    post_url('/api/v0/users', user_details)
  end

  def get_one_user(session_id)
    get_url("/api/v0/users/#{session_id}")
  end

  def all_leagues_for_one_user(session_id)
    get_url("/api/v0/users/#{session_id}/leagues")
  end

  def get_all_users
    get_url('/api/v0/users')
  end

  def create_league(league_details)
    league_post_url('/api/v0/leagues', league_details)
  end

  def get_one_league(league_id)
    get_url("/api/v0/leagues/#{league_id}")
  end

  def get_user_leagues(league_id)
    get_url("/api/v0/leagues/#{league_id}/user_leagues")
  end

  def new_user_league(ul_details)
    ul_post_url('/api/v0/user_leagues', ul_details)
  end

  def get_league_info(league_id)
    get_url("/api/v0/leagues/#{league_id}")
  end

  def create_roster_team(pick_details)
    pick_post_url("/api/v0/roster_teams", pick_details)
  end

  def get_roster_teams(user_league_id)
    get_url("/api/v0/user_leagues/#{user_league_id}/roster_teams")
  end

  def get_one_team(team_id)
    get_url("/api/v0/teams/#{team_id}")
  end

  def get_all_teams
    get_url('/api/v0/teams')
  end

  private

  def post_url(url, user_details)
    response = conn.post(url, user: user_details, header: { 'CONTENT_TYPE' => 'application/json' })
    JSON.parse(response.body, symbolize_names: true)
  end

  def league_post_url(url, league_details)
    response = conn.post(url, league: league_details, header: { 'CONTENT_TYPE' => 'application/json' })
    JSON.parse(response.body, symbolize_names: true)
  end

  def ul_post_url(url, ul_details)
    response = conn.post(url, user_league: {league_id: ul_details[:league_id], user_id: ul_details[:user_id]}, header: { 'CONTENT_TYPE' => 'application/json' })
    JSON.parse(response.body, symbolize_names: true)
  end

  def pick_post_url(url, pick_details)
    response = conn.post(url, roster_teams: {user_league_id: pick_details[:user_league_id], api_team_id: pick_details[:api_team_id]}, header: { 'CONTENT_TYPE' => 'application/json' })
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    if Rails.env.production?
      Faraday.new(url: 'https://draftmadnessapi.herokuapp.com')
    else 
      Faraday.new(url: 'http://localhost:3000')
    end
  end
end
