require 'rails_helper'

RSpec.describe BinariesConversionController, type: :controller do
  describe 'GET index' do
    context 'with valid params' do
      it "returns a 200" do
        get :index, params: { binary: '1011' }
        expect(response).to have_http_status(:ok)
      end

      it "returns the json with the correct conversion" do
        get :index, params: { binary: '1011' }
        parsed_response = JSON.parse(response.body)
        expected_json = { "converted_number" => 11 }
        expect(parsed_response).to eq(expected_json)
      end
    end

    context 'with invalid params' do
      it "returns a unprocessable entity" do
        get :index, params: { binary: '1011FF' }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns the json with the invalid message" do
        get :index, params: { binary: '1011FF' }
        parsed_response = JSON.parse(response.body)
        error_message = { "message" => "Enter either 0 or 1" }
        expect(parsed_response).to eq(error_message)
      end
    end
  end
end