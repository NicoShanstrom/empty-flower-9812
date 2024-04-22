class MechanicRidesController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    @ride = Ride.find(params[:ride_id])
    @mechanic.rides << @ride
    # require 'pry'; binding.pry
    redirect_to mechanic_path(@mechanic)
  end
end