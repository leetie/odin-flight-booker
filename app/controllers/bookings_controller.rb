class BookingsController < ApplicationController

  def index
    redirect_to root_path
  end

  def create
    @booking = Booking.new()
  end

  def new
    @num_passengers = params[:passengers]
    @flight = Flight.find(params[:selected_flight])
  end

  private

end
