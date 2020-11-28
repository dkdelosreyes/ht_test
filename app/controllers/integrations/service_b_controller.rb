class Integrations::ServiceBController < Integrations::BaseController

  skip_before_action :verify_authenticity_token, only: %w(create)

  before_action :ensure_required_params, only: %w(create)

  def create

    Reservation.transaction do
      begin

        guest_params = params[:guest]

        guest = Guest.find_or_create_by!(email: guest_params[:email]) do |g|
          g.first_name  = guest_params[:first_name]
          g.last_name   = guest_params[:last_name]
          g.external_id = guest_params[:id]
        end

        guest.create_phones guest_params[:phone]

        reservation = guest.reservations.service_b.new parsed_reservation

        if reservation.save
          render json: { message: 'success' }, status: :ok
        else
          render json: { error: reservation.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end

      rescue ActiveRecord::RecordInvalid => ex
        render json: { error: ex.message }, status: :unprocessable_entity
        raise ActiveRecord::Rollback, ex.to_s
      end
    end
  end

  private

  def ensure_required_params
    params.permit(:start_date, :end_date, guest: {}).tap do |fields|
      fields.require(:start_date)
      fields.require(:end_date)

      fields.require(:guest).permit(:email).tap do |guest_fields|
        guest_fields.require(:email)
      end
    end
  end

  def parsed_reservation
    {
      start_date:     params[:start_date],
      end_date:       params[:end_date],
      payout_price:   params[:payout_price],
      security_price: params[:security_price],
      total_price:    params[:total_price],
      currency:       params[:currency],
      nights_count:   params[:nights],
      guests_count:   params[:guests],
      status:         params[:status],
      adults_count:   params[:adults],
      children_count: params[:children],
      infants_count:  params[:infants]
    }
  end
end
