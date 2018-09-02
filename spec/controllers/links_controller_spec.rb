require 'rails_helper'

RSpec.describe LinksController, type: :request do
  describe 'GET /:short_code' do
    context 'when link with short code present' do
      let!(:link) { create(:link, original_url: 'https://google.com', short_code: 'google') }

      it 'redirects to original url address' do
        get "/#{link.short_code}"
        expect(response.redirect_url).to eq link.original_url
      end

      it 'track visitor' do
        expect { get "/#{link.short_code}" }.to change { link.visits.reload.size }.from(0).to(1)
      end
    end

    context 'when no link with short code' do
      before do
        get '/no_short_code'
      end

      it 'redirects to root page' do
        expect(response.redirect_url).to eq root_url
      end

      it 'not track visitor' do
        expect(Visit.all.size).to be 0
      end
    end
  end
end
