class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
  end
end
