module Adventure
  class Forest < Room
    def describe(character)
      puts "The forest is green and leafy. There are trees everywhere.\n" +
           "The path winds through the trees and you are surrounded by birdsong\n" +
           "and the smell of pine cones, leaves and the musty smell of hundreds of\n" +
           "fallen leaves and nettles. You suspect a thousand small animals are hiding\n" +
           "amongst the foliage and thick shrubbery. When you look up at the canopy\n" +
           "above you, you are greeted with what the Japanese call 'komorebi', the beautiful\n" +
           "interplay of sunlight filtering through the myriad of leaves of nature's ceiling\n" +
           "above you. You notice a nest high up in the tree next to you. It looks like\n" +
           "a crow's nest. It is too high to reach, even with grappling hooks.\n" +
           "Underneath the tree is a dense thicket, but it looks like there is a hole\n" +
           "large enough to crawl through. You can also head back to the bridge."
    end

    def interpret(rooms, action, character)
      if (action.include?('nest') or action.include?('crow') or action.include?('tree') or action.include?('climb') or action.include?('hook') or action.include?('grap'))
        puts "The nest is too high to reach. Perhaps you can make another plan."
      elsif (action.include?('crawl') or action.include?('hole'))
        character.change_location(rooms['Thicket'])
      elsif (action.include?('back') or action.include?('bridge'))
        character.change_location(rooms['Troll'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end