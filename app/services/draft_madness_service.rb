class DraftMadnessService
  def register_user(user_details)
    post_url('/api/v0/users', user_details)
  end

  def get_one_user(session_id)
    get_url("/api/v0/users/#{session_id}")
  end

  def get_all_users
    get_url('/api/v0/users')
  end

  def create_league(league_details)
    league_post_url('/api/v0/leagues', league_details)
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

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:3000')
  end
end
