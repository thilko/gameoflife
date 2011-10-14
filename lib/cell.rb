module GameOfLife
  class Cell

    attr_accessor :alive

    def evolve
      if @alive && living_neighbours < 2 || living_neighbours > 3
        @alive = false
      end

      if !@alive && living_neighbours == 3
        @alive = true
      end
    end

    def alive?
      alive
    end

    def alive
      @alive ||= false
    end

    def increment_neighbours
      @living_neighbours = living_neighbours + 1
    end


    def living_neighbours
      warn @living_neighbours ||= 0
      @living_neighbours ||= 0
    end

    def living_neighbours=(count)
      @living_neighbours = count
    end

    def generation
      @generation ||= Array.new(4) { Array.new(4){ GameOfLife::Cell.new } }
    end



  end
end
