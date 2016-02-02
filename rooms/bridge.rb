module Adventure
  class Bridge < Room
    def describe(character)
      puts "\nTBD"
    end

    def interpret(rooms, action, character)
      if (action.include?('feather') or action.include?('crow'))
        if (character.has?('crow feather'))
        else
        end
      elsif (action.include?('climb')) or (action.include?('down'))
      else
        super(rooms, action, character)
      end
      character
    end
  end
end