class BookingsController < ApplicationController
  before_action :set_booking, except: [:create, :new]

  def index
    redirect_to root_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.create(booking_params)
    respond_to do |format|
      if @booking.save
        @passengers = []
        params[:booking][:passengers_attributes].each do |k, v|
        @passengers << [v["name"], v["email"]]
        end
        #add each passenger to mailer params[:passengers]
        #tell mailer to send thank you email after save
        PassengerMailer.with(passengers: @passengers, flight: @booking.flight).thank_you_email.deliver_later
        format.html { redirect_to(@booking, notice: "Booking Successfully Created!") }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def new
    @num_passengers = params[:passengers].to_i
    puts params[:passengers]
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
