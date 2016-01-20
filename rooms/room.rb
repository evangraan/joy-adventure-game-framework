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
      puts "You look at all the things you have. You see:"
      character.inventory.each do |item, detail|
        puts item
      end
    elsif (action == 'look')
      character.location_seen = false
    else
      puts "I don't know how to interpret #{action}"
    end
  end
end