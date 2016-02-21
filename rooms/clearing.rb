module Adventure
  class Clearing < Room
    def describe(character)
      puts "You emerge on the edge of the forest in a beautiful clearing. Trees are scattered\n" +
           "here and there. Open skies greet you and you feel a strong wind tugging at\n" +
           "your clothes and pushing at your cheeks. You can see the palace in the distance,\n" +
           "it seems so far away now. You can crawl back into the thicket if you like."
      if character.has?('royal necklace')
        puts "You notice a beautiful kite with a long tail stuck against one of the lower\n" +
             "branches of one of the trees. It is beautiful, but stuck. Perhaps you could\n" +
             "manage to free it?"
      end
    end

    def interpret(rooms, action, character)
      if (action.include?('crawl') or action.include?('thicket'))
        character.change_location(rooms['Thicket'])
      elsif (action.include?('kite') or action.include?('free') or action.include?('tail'))
        puts "You get working on figuring out how to free the kite."
        character.change_location(rooms['Clouds'])
      else
        super(rooms, action, character)        
      end
      character
    end
  end
end