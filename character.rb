module Adventure
  class Character
    attr_accessor :name
    attr_accessor :location
    attr_accessor :location_seen
    attr_accessor :inventory
    attr_accessor :visited

    def initialize
      @location = nil
      @inventory = {}
      @location_seen = false
      @visited = {}
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
      room = location.class.to_s.gsub("Adventure::", "")
      @visited[room] = true
    end

    def interpret(rooms, action, character)
      location.interpret(rooms, action, character)
    end

    def show_inventory
      puts "You look at all the things you have. You see:"
      @inventory.each do |item, detail|
        puts item
      end 
    end

    def has?(item)
      not (@inventory[item].nil?)
    end

    def give(item)
      @inventory[item] = 1
    end

    def prompt
      @location.prompt
    end

    def save
      filename = "saves/#{@name.downcase}"
      data = { 'location' => @location.class.to_s.gsub("Adventure::", ""),
               'inventory' => @inventory,
               'visited' => @visited }
      File.open(filename,"w") do |f|
        f.write(data.to_json)
      end
    end

    def help
      puts "Remember to exit the game using 'exit'. This will save your progress."
      puts "To see what you are carrying, type 'inventory'"
      puts "To look at the room you are in, type 'look'"
      puts "Type 'places' to see where you can teleport to. More places become available for teleportation as you visit them."
      puts "At any time, type 'help' to see this information."
      puts "Feel free to type commands you think might work when exploring!"
      puts "Have fun!!"
    end

    def places
      puts "You can teleport to the following places by typing 'teleport' and then the name of the place:"
      @visited.each do |place, value|
        puts place if value
      end
      puts "If only you had a teleportation device..." if not @inventory.include?('teleportation device')
    end

    def teleport_to(rooms, room)
      if @inventory.include?('teleportation device')
        if @visited[room]
          puts "You enter the destination on your teleporter and press 'GO'. You spin faster and faster, hear a popping sound and see a flurry of rainbows surrounding you. You arrive at your destination!\n"
          change_location(rooms[room])
          @location_seen = false
        else
          puts "The teleportation device emits a low hum and squeak. You have not visited #{room} before. You cannot teleport there. You can use 'places' to see where you can teleport to."
        end
      else
        puts "You do not have a teleporter!"
      end
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
      @location ||= 'Academy'
      @location_seen = false
      @inventory = data['inventory']
      @inventory ||= {}
      @visited = data['visited']
      @visited ||= {}
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