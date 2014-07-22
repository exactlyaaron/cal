require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do

  context ".calculate" do

    it "returns Tuesday for July 2014" do
      ZellersCongruence.calculate(7, 2014).should == 3
    end

    it "returns Thursday for March 1990" do
      ZellersCongruence.calculate(3, 1990).should == 5
    end

    it "returns Sunday for February 2004" do
      ZellersCongruence.calculate(2, 2004).should == 1
    end

    it "returns Thursday for February 2004" do
      ZellersCongruence.calculate(2, 1900).should == 5
    end

  end

end
