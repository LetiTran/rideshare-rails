class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    @passenger = Passenger.find(id)

    @total_paid = 0
    @passenger.trips.each do |trip|
      @total_paid += trip.cost
    end

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
