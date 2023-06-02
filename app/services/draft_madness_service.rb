class DraftMadnessService
  def register_user(user_details)
    post_url('/api/v0/users', user_details)
  end

  private

  def post_url(url, user_details)
    response = conn.post(url, user_details: user_details, header: { 'CONTENT_TYPE' => 'application/json' })
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
