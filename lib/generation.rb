module GameOfLife
  class Generation
    def evolve
      generation.each_with_index do |row, row_index|
        row.each_with_index do |column, column_index |
          generation[row_index][column_index].evolve
        end
      end
    end

    def count_neighbours
      generation.each_with_index do |row, row_index|
        row.each_with_index do |column, column_index |
          [
            {:row => -1, :col => -1},
            {:row => -1, :col => 0},
            {:row => -1, :col => 1},
            {:row => 0, :col => -1},
            {:row => 1, :col => 1},
            {:row => 1, :col => -1},
            {:row => 1, :col => 1},
        ].each do |neighbour|
          if generation[neighbour[:row]+row_index] && generation[neighbour[:row]+row_index][neighbour[:col]+column_index]
            cell = generation[neighbour[:row]+row_index][neighbour[:col]+column_index]
            generation[row_index][column_index].increment_neighbours if cell.alive?
          end
        end
        end
      end
    end
    def [](other)
      generation[other]
    end

    def generation
      @generation ||= Array.new(4) { Array.new(4) { GameOfLife::Cell.new } }
    end
  end
end
