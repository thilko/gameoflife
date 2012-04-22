# -*- encoding : utf-8 -*-
class Cell

  def self.create_living_cell
    new true
  end

  def self.create_dead_cell
    new false
  end

  def self.create_random_cell
    new (rand(2) == 1 ? true : false)
  end

  def initialize(alive)
    @alive = alive
  end

  def alive?
    @alive
  end

  def be_alive!
    @alive = true
  end

  def shall_die?(living_neighbour_count)
    living_neighbour_count < 3
  end

  def shall_be_alive?(living_neighbour_count)
    true
  end

  def dead?
    !@alive
  end

  def die!
    @alive = false
  end
end
