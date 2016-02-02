module Adventure
  class Window < Room
    def describe(character)
      puts "\nLooking down the kingdom's kind people seem small, and \n" +
          "you feel the chilly draft from the open window.\n"
      if (character.has?('crow feather'))          
        puts "You probably should climb down and continue with your quest."
      else
        puts "On the window sill you find one lonely black \n" +
        "feather. It is a crow's feather. Crows do so love shiny things..."
      end
    end

    def interpret(rooms, action, character)
      if (action.include?('feather') or action.include?('crow'))
        if (character.has?('crow feather'))
          puts "You take the feather from your pocket. It has not turned \n" +
          "into anything other than a crow's feather since you picked it up."
        else
          puts "You examine the feather up close. It is definitely a crow's\n" +
          "feather. You put it in your pocket."
          character.give('crow feather')
        end
      elsif (action.include?('climb')) or (action.include?('down'))
        puts "To the worried gasps and occasional alarmed shout of the citizens\n" +
        "you rappel down the wall and land firmly on your feet in the grand ballroom."
        character.change_location(rooms['Palace'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end