require_relative '../lib/month'

RSpec.describe Month do

  #testing a .header method
  context ".header" do

    it "matches cal for December 2012" do
      month = Month.new(12, 2012)
      month.header.should == "   December 2012"
    end

    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end

  #testing a .name method
  context ".name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end

    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end

    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end

    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end

    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end

    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end

    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end

    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end

    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end

    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end

    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end

    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end
  end

  context ".length" do
    it "tells that 31 days are in December 2012" do
      month = Month.new(12, 2012)
      month.length.should == 31
    end

    it "tells that 30 days are in June 2014" do
      month = Month.new(6, 2014)
      month.length.should == 30
    end

    it "tells that 29 days are in February 2004" do
      month = Month.new(2, 2004)
      month.length.should == 29
    end

    it "tells that 28 days are in February 2005" do
      month = Month.new(2, 2005)
      month.length.should == 28
    end

    it "tells that 28 days are in February 1900" do
      month = Month.new(2, 1900)
      month.length.should == 28
    end
  end

#   context ".print_weeks" do
#     it "should print out 1 - 31" do
#       month = Month.new(12, 2012)
#       month.build_month_array
#       expected = <<EOS
#                    1
#  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22
# 23 24 25 26 27 28 29
# 30 31
# EOS
#       actual = month.print_weeks
#       actual.should == expected
#     end
#   end

  #testing a .build_first_week method
  context ".build_month_array" do

    it "should build the first line of the month array" do
      month = Month.new(12, 2012)
      month.build_month_array.should == [[nil, nil, nil, nil, nil, nil, 1],
                                         [2, 3, 4, 5, 6, 7, 8],
                                         [9, 10, 11, 12, 13, 14, 15],
                                         [16, 17, 18, 19, 20, 21, 22],
                                         [23, 24, 25, 26, 27, 28, 29],
                                         [30, 31, nil, nil, nil, nil, nil]]
    end

  end


end
