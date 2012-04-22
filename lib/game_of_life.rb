# -*- encoding : utf-8 -*-
class GameOfLife
  attr_accessor :cells, :height, :width

  def initialize(opts)
    self.width = opts[:width] || 4
    self.height = opts[:height] || 4
    self.cells = Array.new(self.width) { Array.new(self.height) }
  end

  def seed
    cells.collect! do |row|
      row.collect! { |cell| Cell.create_random_cell }
    end
  end

  def self.create(opts={})
    opts.merge! :height => 4, :width => 4
    generation = new opts

    generation.cells.collect! do |row|
      row.collect! do |cell|
        Cell.create_dead_cell
      end
    end
    generation
  end

  def [](index)
    cells[index]
  end

  def evolve
    new_generation = clone
    cells.each_with_index do |row, r_index|
      row.each_with_index do |cell, c_index|
        living_neighbours = count_living_cells_for(r_index, c_index)

        p living_neighbours
        if cell.shall_die? living_neighbours
          cell.die!
        elsif cell.shall_be_alive? living_neighbours
          cell.be_alive!
        end
      end
    end
    new_generation
  end

  def count_living_cells_for(r_index, c_index)
    min_c_index = (c_index-1 < 0) ? 0 : c_index-1
    max_c_index = (c_index+1 > c_index) ? c_index : c_index+1

    first = cells[r_index-1][min_c_index..max_c_index] if r_index >= 0
    second = cells[r_index][min_c_index..max_c_index]
    second.delete_at(1)
    third = cells[r_index+1][min_c_index..max_c_index] if r_index+1 <= r_index

    ((first || []) + second + (third || [])).inject(0) do |memo, item|
      memo += 1 if item.alive?
      memo
    end
  end
end
