module Adventure
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
      load_or_greet(rooms, name)
    end

    def look_at_room
      @location_seen = false
    end

    def change_location(location)
      @location = location
      @location_seen = false
    end

    def interpret(rooms, action, character)
      location.interpret(rooms, action, character)
    end

    def prompt
      @location.prompt
    end

    def save
      filename = "saves/#{@name.downcase}"
      data = { 'location' => location.class.to_s.gsub("Adventure::", ""),
               'inventory' => inventory }
      File.open(filename,"w") do |f|
        f.write(data.to_json)
      end
    end

    def help
      puts "Remember to exit the game using 'exit'. This will save your progress."
      puts "To see what you are carrying, type 'inventory'"
      puts "To look at the room you are in, type 'look'"
      puts "At any time, type 'help' to see this information."
      puts "Feel free to type commands you think might work when exploring!"
      puts "Have fun!!"
    end

    private

    def load_or_greet(rooms, name)
      filename = "saves/#{@name.downcase}"
      File.exists?(filename) ? load_saved_data(rooms, filename) : welcome
    end

    def load_saved_data(rooms, filename)
      content = File.read(filename)
      data = JSON.parse(content)
      @location = rooms[data['location']]
      @location_seen = false
      @inventory = data['inventory']
    end    

    def greet
      puts "\nWelcome adventurer #{@name}!!"
    end

    def welcome
      greet
      help
    end
  end
end