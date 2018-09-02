require 'rails_helper'

RSpec.describe Api::VisitsController, type: :request do
  include ApiHelper

  describe 'GET /api/visits' do
    let!(:link)  { create(:link, original_url: 'https://google.com', short_code: 'google') }
    let!(:link2) { create(:link, original_url: 'https://github.com', short_code: 'github') }

    before do
      [link, link2].each { |l| get "/#{l.short_code}",  headers: headers }
      get '/api/visits', headers: headers
    end

    it 'response json contains visited links' do
      links_array = [link, link2].map { |i| i.attributes.slice('original_url', 'short_code') }
      expect(response_body.pluck('link')).to match_array links_array
    end

    it 'links visitor has correct ip address' do
      expect(response_body.pluck('ip')).to include request.remote_ip
    end
  end
end
