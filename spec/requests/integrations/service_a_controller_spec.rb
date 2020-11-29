require 'rails_helper'

RSpec.describe Integrations::ServiceAController, type: :request do

  describe 'POST /integrations/service_a' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          "reservation": {
            "start_date": "2020-03-12",
            "end_date": "2020-03-16",
            "expected_payout_amount": "3800.00",
            "guest_details": {
              "localized_description": "4 guests",
              "number_of_adults": 2,
              "number_of_children": 2,
              "number_of_infants": 0
            },
            "guest_email": "wayne_woodbridge@bnb.com",
            "guest_first_name": "Wayne",
            "guest_id": 1,
            "guest_last_name": "Woodbridge",
            "guest_phone_numbers": [
              "639123456789",
              "639123456788"
            ],
            "listing_security_price_accurate": "500.00",
            "host_currency": "AUD",
            "nights": 4,
            "number_of_guests": 4,
            "status_type": "accepted",
            "total_paid_amount_accurate": "4500.00"
          }
        }
      end

      it 'creates a reservation' do
        expect { post '/integrations/service_a', params: valid_params }.to change(Reservation, :count).by(+1)
        expect(response).to have_http_status :created
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          "reservation": {}
        }
      end

      it 'returns status bad_request' do
        post '/integrations/service_a', params: invalid_params
        expect(response).to have_http_status :bad_request
      end
    end
  end
end


