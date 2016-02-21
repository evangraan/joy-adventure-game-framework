module Adventure
  class Thicket < Room
    def describe(character)
      puts "You get down on all fours and squeeze your way through the leaves and branches\n" +
           "into the thicket. You find yourself in a small space, directly under the crow's\n" +
           "nest under the tree. If anything dropped from the nest, it would land here. It is\n" +
           "too dark to see anything. Perhaps you should search around. You have crept in\n" +
           "quite deep and the space is tight with no room to turn around. You realize\n" +
           "you cannot crawl back and will have to push through."
    end

    def interpret(rooms, action, character)
      if (action.include?('crawl') or action.include?('out') or action.include?('push') or action.include?('through'))
        if character.has?('royal necklace')
          puts "You push through and crawl out of the thicket, the branches and leaves tugging at your clothes on the way out."
          character.change_location(rooms['Clearing'])
        else
          puts "As you crawl forward, your have touches something hard, almost rock-like,\n" +
               "but it feels as though it is man-made, crafted even. If only you could see."
        end
      elsif (action.include?('search'))
        puts "It is too dark to see. Your search reveals nothing. Perhaps if you had something to help you see?"
      elsif (action.include?('night') or action.include?('vision') or action.include?('goggle'))
        if character.has?('night-vision goggles')
          if character.has?('royal necklace')
            puts "You put on the night vision goggles. The dark thicket is bathed in a pale green light.\n" +
                 "A quick search reveals that all is as you left it last. You don't notice anything new of value."
          else
            puts "You put on the night vision goggles. The dark thicket is bathed in a pale green light.\n" +
                 "You quickly search the thicket and find what looks like a necklace half-buried in the\n" +
                 "thistles and leaves! You immediately put it in your back-pack.\n" +
                 "The king and queen will be so pleased!"
            character.give('royal necklace')
          end
        else
          puts "You don't have night vision goggles with you. Did you pick them up at the secret spy laboratory?"
        end
      elsif (action.include?('ahead') or action.include?('clear'))
        character.change_location(rooms['Clearing'])
      elsif (action.include?('back') or action.include?('bridge'))
        character.change_location(rooms['Troll'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end