class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics

  def unique_name
    mechanics.distinct.pluck(:name)
  end
  # if i did not add a relationship for mechanics and amusement parks
  #this could be the AR query. 
  # def unique_mechanic_names
  #   Mechanic.joins(:rides).distinct.pluck(:name)
  # end
end