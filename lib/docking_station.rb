require './lib/bike.rb'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20
  def initialize (capacity = DEFAULT_CAPACITY)
      @bikes =[]
      @capacity = capacity
  end

  def release_bike
    if empty?
      raise('Sorry there are no bikes')
    else
      bikes.pop
    end
  end

  def docks_bike (bikeinstance)
    if full?
      raise('There are no spaces left')
    else
      bikes.push(bikeinstance)
      bikes[-1]
    end
  end

private
  def full?
    return true if bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    return true if bikes.empty?
  end
end
