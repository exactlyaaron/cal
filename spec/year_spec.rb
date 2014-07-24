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

  # #testing a .header method
  # context ".build_year_array" do
  #
  #   it "returns an array of all days in the year" do
  #     year = Year.new(2012)
  #     year.build_year_array.should == [[nil, nil, nil, nil, nil, nil, 1],
  #                                      [2, 3, 4, 5, 6, 7, 8],
  #                                      [9, 10, 11, 12, 13, 14, 15],
  #                                      [16, 17, 18, 19, 20, 21, 22],
  #                                      [23, 24, 25, 26, 27, 28, 29],
  #                                      [30, 31],
  #
  #                                      [nil, nil, nil, nil, nil, nil, 1],
  #                                      [2, 3, 4, 5, 6, 7, 8],
  #                                      [9, 10, 11, 12, 13, 14, 15],
  #                                      [16, 17, 18, 19, 20, 21, 22],
  #                                      [23, 24, 25, 26, 27, 28, 29],
  #                                      [30, 31],
  #
  #                                      [nil, nil, nil, nil, nil, nil, 1],
  #                                      [2, 3, 4, 5, 6, 7, 8],
  #                                      [9, 10, 11, 12, 13, 14, 15],
  #                                      [16, 17, 18, 19, 20, 21, 22],
  #                                      [23, 24, 25, 26, 27, 28, 29],
  #                                      [30, 31],
  #
  #                                      [nil, nil, nil, nil, nil, nil, 1],
  #                                      [2, 3, 4, 5, 6, 7, 8],
  #                                      [9, 10, 11, 12, 13, 14, 15],
  #                                      [16, 17, 18, 19, 20, 21, 22],
  #                                      [23, 24, 25, 26, 27, 28, 29],
  #                                      [30, 31],
  #
  #                                      [nil, nil, nil, nil, nil, nil, 1],
  #                                      [2, 3, 4, 5, 6, 7, 8],
  #                                      [9, 10, 11, 12, 13, 14, 15],
  #                                      [16, 17, 18, 19, 20, 21, 22],
  #                                      [23, 24, 25, 26, 27, 28, 29],
  #                                      [30, 31],
  #
  #                                      [nil, nil, nil, nil, nil, nil, 1],
  #                                      [2, 3, 4, 5, 6, 7, 8],
  #                                      [9, 10, 11, 12, 13, 14, 15],
  #                                      [16, 17, 18, 19, 20, 21, 22],
  #                                      [23, 24, 25, 26, 27, 28, 29],
  #                                      [30, 31]]
  #   end
  #
  # end

end
