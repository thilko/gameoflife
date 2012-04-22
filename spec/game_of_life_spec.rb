# -*- encoding : utf-8 -*-
require "spec_helper"

describe GameOfLife do
  subject do
    GameOfLife.create(:height => 4, :width => 4)
  end

  it "has cells" do
    subject.cells.should_not be_nil
  end

  it "can be created with dimensions" do
    gof = GameOfLife.create(:height => 4, :width => 4)
    gof.height.should == 4
    gof.width.should == 4
  end

  it "can be seed with a random start population" do
    subject.seed
    subject.cells.flatten.each {|cell| cell.should_not be_nil}
  end

  context "#evolve" do
    it "makes a cell alive with three living neighbours" do
      generation = GameOfLife.create
      generation.cells[0][0].be_alive!
      generation.cells[0][1].be_alive!
      generation.cells[0][2].be_alive!

      new_generation = generation.evolve
      new_generation.cells[1][1].should be_alive
    end

    it "kills a cell with less than 3 living neighbours " do
      generation = GameOfLife.create
      generation.cells[0][0].be_alive!

      new_generation = generation.evolve
      new_generation.cells[1][1].should be_dead
    end
  end
end

