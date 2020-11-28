class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.order(created_at: :desc).all
  end
end
