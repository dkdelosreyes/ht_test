require 'rails_helper'

RSpec.describe Integrations::ServiceBController, type: :request do

  describe 'POST /integrations/service_a' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          "start_date": "2020-03-12",
          "end_date": "2020-03-16",
          "nights": 4,
          "guests": 4,
          "adults": 2,
          "children": 2,
          "infants": 0,
          "status": "accepted",
          "guest": {
            "id": 1,
            "first_name": "Wayne",
            "last_name": "Woodbridge",
            "phone": "639123456789",
            "email": "wayne_woodbridge@bnb.com"
          },
          "currency": "AUD",
          "payout_price": "3800.00",
          "security_price": "500",
          "total_price": "4500.00"
        }
      end

      it 'creates a reservation' do
        expect { post '/integrations/service_b', params: valid_params }.to change(Reservation, :count).by(+1)
        expect(response).to have_http_status :created
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          "nights": {}
        }
      end

      it 'returns status bad_request' do
        post '/integrations/service_b', params: invalid_params
        expect(response).to have_http_status :bad_request
      end
    end
  end
end


