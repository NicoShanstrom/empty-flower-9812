require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  before :each do
      @park1 = AmusementPark.create!(name: "Funtime", admission_cost: 1)

      @ride1 = @park1.rides.create!(name: "Gravitron", thrill_rating: 9, open: true)
      @ride2 = @park1.rides.create!(name: "Chill", thrill_rating: 1, open: true)
      @ride3 = @park1.rides.create!(name: "Wow", thrill_rating: 15, open: true)

      @mech1 = @park1.mechanics.create!(name: "Nico", years_experience: 1)
      @mech2 = @park1.mechanics.create!(name: "Wolf", years_experience: 2)
      @mech3 = @park1.mechanics.create!(name: "Wolf", years_experience: 2)
  
      @mech1_ride1 = MechanicRide.create!(mechanic_id: @mech1.id, ride_id: @ride1.id)
      @mech1_ride2 = MechanicRide.create!(mechanic_id: @mech1.id, ride_id: @ride2.id)
      @mech2_ride1 = MechanicRide.create!(mechanic_id: @mech2.id, ride_id: @ride1.id)
      @mech2_ride2 = MechanicRide.create!(mechanic_id: @mech2.id, ride_id: @ride3.id)
  end

  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics) }
  end

  describe '#instance methods' do
    describe '#unique_name' do
      it 'returns a list of unique names' do
        expect(@park1.unique_name).to eq(["Nico", "Wolf"])
      end
    end
  end
end