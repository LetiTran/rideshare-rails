class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    @passenger = Passenger.find(id)

    @total_paid = 0
    @passenger.trips.each {|trip| @total_paid += trip.cost}

    @trip = Trip.find(id)
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @passenger.save ? (redirect_to passenger_path(@passenger[:id])) : (render :new)
  end

  def edit
    @passenger= Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    if !@passenger.nil?
       @passenger.update(passenger_params) ? (redirect_to passenger_path(@passenger.id)) : (render :edit)
    else
      redirect_to passenger_path(params[:id])
    end
  end

  def destroy
    id = params[:id]
    @passenger = Passenger.find(id)
    @passenger.destroy if @passenger
    redirect_to passengers_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num, :img)
  end
end
