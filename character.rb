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

  def identify(rooms)
    puts "What is your name?"
    @name = gets.gsub("\n", "")
    filename = "saves/#{@name.downcase}"
    if File.exists?(filename)
      content = File.read(filename)
      data = JSON.parse(content)
      @location = rooms[data['location']]
      @location_seen = false
      @inventory = data['inventory']
    else
      puts "\nWelcome adventurer #{@name}!!"
      puts "Remember to exit the game using 'exit'. This will save your progress."
      puts "To see what you are carrying, type 'inventory'"
      puts "To look at the room you are in, type 'look'"
      puts "Feel free to type commands you think might work when exploring!"
      puts "Have fun!!"
    end
  end

  def change_location(location)
    @location = location
    @location_seen = false
  end
end
