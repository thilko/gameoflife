# -*- encoding : utf-8 -*-
require "spec_helper"

describe Cell do
  it "can be created as living cell" do
    Cell.create_living_cell.should be_alive
  end

  it "can be created with a random status" do
    Cell.create_random_cell.should_not be_nil
  end
end
