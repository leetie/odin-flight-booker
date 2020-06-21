class BookingsController < ApplicationController
  before_action :set_booking

  def index
    redirect_to root_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to booking_path(@booking)
  end

  def new
    @num_passengers = params[:passengers].to_i
    @flight = Flight.find(params[:selected_flight])
    @booking = Booking.new
    
    #create empty passenger objects for each passenger to be passed to view
    @num_passengers.times { @booking.passengers.build }
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
