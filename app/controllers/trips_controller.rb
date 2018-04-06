class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @drivers = Driver.all
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    if Trip.exists?(id)
      @trip = Trip.find(id)

      # Can find driver?
      @trip.driver_exist ? @driver = Driver.find(@trip[:driver_id]).name : @driver = "Driver has been deleted."

      # Can fin passanger?
      @trip.passenger_exist ? @passenger = Passenger.find(@trip[:passenger_id]).name : @passenger = "Passenger has been deleted."

    else
      redirect_to user_interfaces_path
    end
  end

  def new
    passenger = Passenger.find(params[:passenger_id])
    driver = Driver.order("RANDOM()").find_by(status: true)
    date = Date.today
    cost = rand(1111..9999)
    @trip = Trip.new(passenger: passenger, driver: driver, date: date, cost: cost)

    self.create
  end

  def create
    @trip.save ? (redirect_to passenger_path(@trip[:passenger_id])) : (render :new)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if !@trip.nil?
      @trip.update(trip_params) ? (redirect_to trip_path(@trip.id)): (render :edit)
    else
      redirect_to trips_path
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy if @trip
    redirect_back(fallback_location: user_interfaces_path)
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  end


end
