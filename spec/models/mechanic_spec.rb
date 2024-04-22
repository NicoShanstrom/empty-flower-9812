require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides)}
    it { should have_many(:rides).through(:mechanic_rides) }
  end
end
