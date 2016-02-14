module Adventure
  class Forest < Room
    def describe(character)
      puts "TBD"
    end

    def interpret(rooms, action, character)
      if (action.include?('bridge'))
        character.change_location(rooms['Troll'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end