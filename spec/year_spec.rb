require_relative '../lib/year'

RSpec.describe Year do

  #testing a .header method
  context ".leap_year?" do

    it "returns true for a leap year" do
      year = Year.new(2012)
      year.leap_year?.should == true
    end

    it "returns false for a non leap year" do
      year = Year.new(2011)
      year.leap_year?.should == false
    end

  end

end
