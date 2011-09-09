module GameOfLife
  class Cell

    def initialize(alive)
      self.alive = alive
    end

    attr_accessor :alive, :neighbour_count

    def alive?
      self.alive
    end
  end
end
