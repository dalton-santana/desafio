require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  describe 'GET /transactions/by_store' do
    it 'works! (now write some real specs)' do
      get '/transactions/by_store'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    before :each do
      @file = fixture_file_upload('files/CNAB.txt', :binary)
    end

    context 'with valid parameters' do
      it 'creates a new Transaction' do
        post transactions_url,
             params: { file: @file }
        expect(response).to be_successful
      end

      it 'renders a JSON response with the new transaction' do
        post transactions_url,
             params: { file: @file }
        expect(response).to be_successful
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
