require 'rails_helper'

RSpec.describe Api::LinksController, type: :request do
  include ApiHelper

  def create_new_link(params)
    post '/api/links', params: params.to_json, headers: headers
  end

  describe 'POST /links' do
    context 'Validation success' do
      let(:params) { { original_url: 'https://hello.io', short_code: 'code' } }

      it 'returns :ok response status' do
        create_new_link(params)
        expect(response).to have_http_status 200
      end

      it 'creates new link record' do
        expect { create_new_link(params) }.to change { Link.all.size }.from(0).to(1)
      end
    end

    describe 'Validation failure' do
      context 'Incorrect original url' do
        let(:params) { { original_url: 'hello', short_code: 'code' } }

        before do
          create_new_link(params)
        end

        it 'returns :bad_request status' do
          expect(response).to have_http_status 400
        end

        it 'returns validation error message' do
          expect(response_body.join).to eq 'Original url is invalid'
        end

        it 'should not create an invalid link record' do
          expect(Link.all.size).to be 0
        end
      end

      context 'Not uniq short code' do
        let(:params) { { original_url: 'https://hello.io', short_code: 'code' } }

        before do
          Link.create(params)
          create_new_link(params)
        end

        it 'returns :bad_request status' do
          expect(response).to have_http_status 400
        end

        it 'returns validation error message' do
          expect(response_body.join).to eq 'Short code has already been taken'
        end

        it 'should not create a link record with duplicate short code' do
          expect(Link.all.size).to be 1
        end
      end
    end
  end
end
