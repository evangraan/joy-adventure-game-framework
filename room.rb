require 'json'

module Adventure
  class Room
    def describe(character)
      puts "You are in a room"
    end

    def prompt
      puts "What do you do?"
      action = gets
      action.downcase.gsub("\n", "")
    end

    def interpret(rooms, action, character)
      if (action.include?('inventory'))
        show_inventory
      elsif (action == 'look')
        character = character.look_at_room
      elsif (action == 'help')
        character.help
      else
        puts "I don't know how to interpret #{action}"
      end
    end

    private

    def show_inventory
      puts "You look at all the things you have. You see:"
      character.inventory.each do |item, detail|
        puts item
      end      
    end
  end
end