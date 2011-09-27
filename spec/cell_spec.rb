require "spec_helper"


describe :cell do

  before do
    @cell = GameOfLife::Cell.new
  end

  context "a dead cell" do
    describe "#evolve" do
      it "will be reborn with three living neighbours" do
        @cell.alive = false 
        @cell.living_neighbours = 3
        @cell.evolve       

        @cell.alive?.should == true
      end
    end
  end

  context "a living cell" do
    it "will stay alive with two living neighbours" do
      @cell.alive = true
      @cell.living_neighbours = 2
      @cell.evolve

      @cell.alive?.should == true
    end

    it "will stay alive with three living neighbours" do
      @cell.alive = true
      @cell.living_neighbours = 3
      @cell.evolve

      @cell.alive?.should == true
    end

    it "will die with 1 living neighbour" do
      @cell.alive = true
      @cell.living_neighbours = 1
      @cell.evolve

      @cell.alive?.should == false
    end

    it "will die with 4 living neighbour" do
      @cell.alive = true
      @cell.living_neighbours = 4
      @cell.evolve

      @cell.alive?.should == false
    end
  end
end
