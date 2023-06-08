class Article
  attr_reader :id,
              :headline,
              :url,
              :published_on

  def initialize(article_data)
    @id = article_data[:id]
    @headline = article_data[:attributes][:headline]
    @url = article_data[:attributes][:url]
    @published_on = article_data[:attributes][:date]
  end
end