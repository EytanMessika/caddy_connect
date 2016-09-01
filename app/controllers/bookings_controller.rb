class BookingsController < ApplicationController
  before_action :check_user_premium_status
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    flash[:notice] = 'Rendez-vous programmé!'
    redirect_to root_path
  end

  private

  def check_user_premium_status
    unless current_user.premium
      redirect_to premium_path
    end
  end

  def booking_params
    params.require(:booking).permit(:datetime, :address, :product_id)
  end
end
