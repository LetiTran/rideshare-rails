class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @drivers = Driver.all
    @passengers = Passenger.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    id = params[:id]
    @trip = Trip.find(id)
  end

  def update
  end

  def destroy
  end
end
