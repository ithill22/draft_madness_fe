class NytService
  def all_articles
    get_url('/api/v0/articles')
  end

  private

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