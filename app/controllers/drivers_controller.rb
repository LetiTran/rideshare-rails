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
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @driver = Driver.find(id)
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if !@driver.nil?
      if @driver.update(driver_params)
        redirect_to driver_path(@driver.id)
      else
        render :edit
      end
    else
      redirect_to drivers_path
    end
  end

  def destroy
    id = params[:id]
    @driver = Driver.find(id)
    if @driver
      @driver.destroy
    end
    redirect_to drivers_path
  end

  def update_status
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :car, :vin, :status)
  end

end
