class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    # Define driver:
    id = params[:id]
    @driver = Driver.find(id)

    # Calculate driver total rating:
    number_of_ratings = 0
    @rating = 0
    Trip.where(driver_id: @driver.id).each do |trip|
      @rating += trip.rating
      number_of_ratings += 1
    end

    @rating == 0 ? "Driver has no trips" : @rating = @rating/number_of_ratings

    # Calculate total earnings:
    @total_earnings = 0
    Trip.where(driver_id: @driver.id).each {|trip| @total_earnings += trip.cost}
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

  def update_status
  end


end
