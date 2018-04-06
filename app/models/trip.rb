class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def trip_exist(id)
    # this checks to see if the trip has been deleted
    trip_id = id
    if Trip.exists?(id: trip_id)
      return true
    else
      return false
    end
  end

  def driver_exist
    # this checks to see if the driver has been deleted
    driver_id = self.driver_id
    if Driver.exists?(id: driver_id)
      return true
    else
      return false
    end

  end

  def passenger_exist
    # this checks to see if the passenger has been deleted
    passenger_id = self.passenger_id
    if Passenger.exists?(id: passenger_id)
      return true
    else
      return false
    end

  end
end
