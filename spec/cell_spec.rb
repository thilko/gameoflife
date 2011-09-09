require "spec_helper"

describe :cell do
  describe :alive? do

    it "returns true if the cell is alive" do
      cell = GameOfLife::Cell.new true
      cell.alive?.should == true
    end

    it "returns false if the cell is dead" do
      cell = GameOfLife::Cell.new false
      cell.alive?.should == false
    end
  end

  describe :neighbour_count do
    it "returns the amount of living cells ins the heighborhood" do
      cell = GameOfLife::Cell.new false
      cell.neighbour_count = 2
      cell.neighbour_count.should == 2 
    end
  end
end

