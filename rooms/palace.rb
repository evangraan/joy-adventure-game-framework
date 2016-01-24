module Adventure
  class Palace < Room
    def describe(character)
      puts "\nTBD"
    end

    def interpret(rooms, action, character)
      if (action.include?('palace') or action.include?('knight'))
        if (character.has?('palace pass'))
        else
        end
      elsif (action.include?('captain') and not(action.include?('ink')))
      else
        super(rooms, action, character)
      end
      character
    end
  end
end