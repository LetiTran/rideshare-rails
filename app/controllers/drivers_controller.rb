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
      if trip.rating == nil
        @rating += 0
      else
        @rating += trip.rating
        number_of_ratings += 1
      end
    end

    @rating == 0 ? "Driver has no trips" : @rating = @rating/number_of_ratings

    # Calculate total earnings:
    @total_earnings = 0

    Trip.where(driver_id: @driver.id).each {|trip| trip.cost == nil ? cost = 0 : @total_earnings += trip.cost }
    # TODO : Do we need this 'cost = 0' ?
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.save ? (redirect_to driver_path(@driver[:id])) : (render :new)
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if !@driver.nil?
      @driver.update(driver_params) ? (redirect_to driver_path(@driver.id)) : (render :edit)
    else
      redirect_to drivers_path
    end
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy if @driver
    redirect_to drivers_path
  end

  def update_status

  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :car, :vin, :status, :img)
  end

end
