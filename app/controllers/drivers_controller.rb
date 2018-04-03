class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    id = params[:id]
    @driver = Driver.find(id)
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
