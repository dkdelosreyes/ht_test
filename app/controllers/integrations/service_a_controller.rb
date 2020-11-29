class Integrations::ServiceAController < Integrations::BaseController

  skip_before_action :verify_authenticity_token, only: %w(create)

  before_action :ensure_required_params, only: %w(create)

  def create

    Reservation.transaction do
      begin

        reservation_params = params[:reservation]

        guest = Guest.find_or_create_by!(email: reservation_params[:guest_email]) do |g|
          g.first_name  = reservation_params[:guest_first_name]
          g.last_name   = reservation_params[:guest_last_name]
          g.external_id = reservation_params[:guest_id]
        end

        guest.create_phones reservation_params[:guest_phone_numbers]

        reservation = guest.reservations.service_a.new parsed_reservation

        if reservation.save
          head :created
        else
          render json: { error: reservation.errors.full_messages.join('. ') }, status: :unprocessable_entity
        end

      rescue ActiveRecord::RecordInvalid => ex
        render json: { error: ex.message }, status: :unprocessable_entity
        raise ActiveRecord::Rollback, ex.to_s
      end
    end
  end

  private

  def ensure_required_params
    params.require(:reservation).permit(:start_date, :end_date, :guest_email).tap do |permitted|
      permitted.require(:start_date)
      permitted.require(:end_date)
      permitted.require(:guest_email)
    end
  end

  def parsed_reservation
    reservation = params[:reservation]

    {
      start_date:     reservation[:start_date].to_date,
      end_date:       reservation[:end_date].to_date,
      payout_price:   reservation[:expected_payout_amount],
      security_price: reservation[:listing_security_price_accurate],
      total_price:    reservation[:total_paid_amount_accurate],
      currency:       reservation[:host_currency],
      nights_count:   reservation[:nights],
      guests_count:   reservation[:number_of_guests],
      status:         reservation[:status_type],
      description:    reservation[:guest_details][:localized_description],
      adults_count:   reservation[:guest_details][:number_of_adults],
      children_count: reservation[:guest_details][:number_of_children],
      infants_count:  reservation[:guest_details][:number_of_infants]
    }
  end
end
