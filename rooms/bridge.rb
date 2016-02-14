module Adventure
  class Bridge < Room
    def describe(character)
      if character.has?('necklace')
        puts "You are on the stone bridge. The tired adventurer looks at you\n" +
             "with a gleam in his eyes. 'The necklace! You've found it! I knew you\n" +
             "would! The king and queen will be delighted!' He dances a little jig of happiness at your success."
      elsif character.has?('discharged pen')
        puts "You are on the stone bridge. The tired adventurer is here. He looks at you with an expression\n" +
             "of wonder and amazement. 'I say, what wonderful magic you worked on\n" +
             "that troll! Amazing! I've never seen such in all my years. Are you one\n" +
             "of the king's spies by any chance? No, no, don't tell me. Fantastic, fantastic!' he says."
      else
        puts "\nYour shoes click and clack as you step onto the stone bridge.\n" +
             "The bridge is quite old and has served the kingdom well for many decades.\n" +
             "At the near side of the bridge you see a weary adventurer resting. As you come closer,\n" +
             "he stands up, dusts his clothes off and turns to speak with you.\n" +
             "'I hope you are not thinking of crossing the bridge. I've tried it twice\n" +
             "in the last couple of days and was lucky to escape with my life.\n" +
             "As I walked to the other side and reached the middle of the bridge, a hideous\n" +
             "bridge troll jumped from under the bridge and tried to eat me! It\n" +
             "was all I could do to get away from him. I did notice that when I\n" +
             "shouted loudly, he did back off a bit, but not for long. He seems to\n" +
             "dislike loud noises.'\n"
      end

      puts "You can head back to the courtyard, or cross the bridge."
    end

    def interpret(rooms, action, character)
      if (action.include?('troll'))
        puts "The adventurer looks at you thoughtfully. 'A sizeable beast it was, \n" +
             "You will need your wits about you to scare it off. It really abhors loud noises.'"
      elsif (action.include?('shout')) or (action.include?('clap') or (action.include?('loud') or (action.include?('pen'))))
        puts "You have to cross the bridge first in order to get to the troll."
      elsif (action.include?('bridge') or action.include?('cross'))
        puts "You muster all the courage you have and bravely step forward.\n" +
             "Determined you match over the bridge."
        character.change_location(rooms['Troll'])
      elsif (action.include?('court')) or (action.include?('yard'))
        character.change_location(rooms['Courtyard'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end