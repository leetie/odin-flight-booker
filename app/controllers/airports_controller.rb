class AirportsController < ApplicationController
  def new
    @airport = Airport.new
  end

  def show
    @airport = Airport.find(params[:id])
  end

  def index
    @airports = Airport.all
  end

  def create
    @airport = Airport.find(params[:id])
    if @airport.save 
      flash.notice = "Airport created successfully"
      redirect_to airport_path(@airport)
    end
  end

  def update
    @airport = Airport.find(params[:id])
    @airport.update(airport_params)
  end

  def destroy
  end

  private

  def airport_params
    params.require(:airport).permit(:name, flight_attributes[:date, :from, :to])
  end
end
