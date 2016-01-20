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
        character.show_inventory
      elsif (action == 'look')
        character = character.look_at_room
      elsif (action == 'help')
        character.help
      elsif (action == 'places')
        character.places
      elsif (action.include?('teleport'))
        destination = action.gsub('teleport to ', '').gsub('teleport ', '')
        destination = destination.capitalize
        character.teleport_to(rooms, destination)
      else
        puts "I don't know how to interpret #{action}"
      end
    end
  end
end