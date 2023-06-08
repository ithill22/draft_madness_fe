require 'rails_helper'

RSpec.describe NytService do
  context 'instance methods' do
    context 'all_articles', :vcr do
      it 'returns an array of article details' do
        results = NytService.new.all_articles

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)

        results[:data].each do |article_details|
          expect(article_details).to have_key(:attributes)
          expect(article_details).to have_key(:id)
          expect(article_details).to have_key(:type)

          article = article_details[:attributes]

          expect(article).to have_key(:headline)
          expect(article).to have_key(:url)
          expect(article).to have_key(:date)

          expect(article[:headline]).to be_a(String)
          expect(article[:url]).to be_a(String)
          expect(article[:date]).to be_a(String)
        end
      end
    end
  end
end
