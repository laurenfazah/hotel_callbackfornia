class ReservationsController < ProtectedController
  def index
    @reservations = current_guest.reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to guest_reservations_path(current_guest)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id).merge(guest_id: current_guest.id)
  end
end