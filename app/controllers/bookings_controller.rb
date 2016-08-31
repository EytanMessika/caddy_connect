class BookingsController < ApplicationController
  before_action :check_user_premium_status
  def create
    @booking = Booking.new(booking_params)
  end

  private

  def check_user_premium_status
    unless current_user.premium
      redirect_to premium_path
    end
  end
end
