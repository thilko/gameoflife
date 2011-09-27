module GameOfLife
  class Cell

    attr_accessor :alive, :living_neighbours

    def evolve
      if @alive && @living_neighbours < 2 || @living_neighbours > 3
        @alive = false
      end

      if !@alive && @living_neighbours == 3
        @alive = true
      end
    end

    def alive?
      @alive
    end

    def alive
      @alive ||= false
    end
  end
end
