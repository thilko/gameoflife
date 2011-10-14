require "spec_helper"
require "generation"

describe :generation do
  describe  :bla do
    it "do something" do
      generation[0][0].alive = true
      generation[0][1].alive = true
      generation[0][2].alive = true
      generation[0][3].alive = true

      generation.count_neighbours
      generation.evolve

      generation[1][1].should be_alive
    end
  end
end

def generation
  @generation ||= GameOfLife::Generation.new
end
