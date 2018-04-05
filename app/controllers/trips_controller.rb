class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @drivers = Driver.all
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)

    if @trip.driver_exist
      @driver = Driver.find(@trip[:driver_id]).name
    else
      @driver = "Driver has been deleted."
    end

    if @trip.passenger_exist
      @passenger = Passenger.find(@trip[:passenger_id]).name
    else
      @passenger = "Passenger has been deleted."
    end
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
    @trip = Trip.find_by(id: params[:id])
    if !@trip.nil?
      if @trip.update(trip_params)
        redirect_to trip_path(@trip.id)
      else
        render :edit
      end
    else
      redirect_to trips_path
    end
  end

  def destroy
    id = params[:id]
    @trip = Trip.find(id)
    if @trip
      @trip.destroy
    end
    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  end


end
