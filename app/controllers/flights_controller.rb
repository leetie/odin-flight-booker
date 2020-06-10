class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_options = Airport.all.map{ |a| [a.name, a.id]}
    puts "params are #{params}"
    if (params[:from] && params[:to])
      @from = Airport.where(id: params[:from]).first
      @to = Airport.where(id: params[:to]).first
      @selected_flights = nil

      Flight.all.each do |f|
        if (f.from.first == @from && f.to.first == @to)
          if @selected_flights == nil
            @selected_flights = []
          end
          @selected_flights << f
        end
        if @selected_flights != nil
          #make @flight_options for dropdown select
          @flight_options = @selected_flights.map { |f| [f.date, f.id] }
          puts @flight_options
        end
      end
      puts "@selected flights are #{@selected_flights}"
    end

  end
          

  def create
  end
end
