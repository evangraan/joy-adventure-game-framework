class Character
  attr_accessor :name
  attr_accessor :location
  attr_accessor :location_seen
  attr_accessor :inventory

  def initialize(location)
    @location = location
    @inventory = {}
    @location_seen = false
  end

  def identify
    puts "What is your name?"
    @name = gets
  end

  def change_location(location)
    @location = location
    @location_seen = false
  end
end