class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_options = Airport.all.map{ |a| [a.name, a.id]}
    puts "Hello, from airport is #{params[:from]}"
    puts "Hello, to airport is #{params[:to]}"
    puts "Hello, params are #{params}"
    @from = 1
    @to = 1
    if (params[:from] && params[:to])
      @from = Airport.where(id: params[:from]).first
      @to = Airport.where(id: params[:to]).first
      puts "from is #{@from}"
      puts "to is #{@to}"
      @selected_flights = @flights.to_a.select do |f|
        f.to.first.id == @to.id #&& f.from.first.id == @from.id
        puts "selected flights are #{@selected_flights}"
      end
    end

    #@selected_flights = Flight.where('to = ?, from = ?', @to.ids, @from.ids)
    #@selected_flights = Flight.where(to.first =  @to, from.first =  @from)
  end

  def create
  end
end
