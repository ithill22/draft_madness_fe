require 'rails_helper'

RSpec.describe Article do
  it 'exists and has attributes' do
    attrs = {
      id: '1234',
      attributes: {
        headline: 'This is a compeling headline',
        url: 'some/url/urlsareoverrated.com',
        date: '2021-08-01'
      }
    }

    article = Article.new(attrs)

    expect(article).to be_a(Article)
    expect(article.id).to eq('1234')
    expect(article.headline).to eq('This is a compeling headline')
    expect(article.url).to eq('some/url/urlsareoverrated.com')
    expect(article.published_on).to eq('2021-08-01')
  end
end
