class Bike
  def initialize (working = true)
    @working = working
  end

  attr_reader :working

  def broken
      @working = false
      self
  end

  def working?
    working
  end

end
