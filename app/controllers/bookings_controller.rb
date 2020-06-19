class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    puts params
  end 

  def index
    
  end
end
