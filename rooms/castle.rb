module Adventure
  class Castle < Room
    def describe(character)
      puts "\nYou stand in front of a beautiful, majestic palace. Opulance surrounds you.\n" +
           "Tall ramparts draped in colourful blue, green and red flags greet you, and a\n" +
           "sense of honor and pride exudes from every brick in the majestic building. A\n" +
           "draw-bridge leads from the court-yard, past a perfectly kept flower garden,\n" +
           "across a wide moat, and beyond the raised portcullis into the wondrous castle\n" +
           "beyond. No-one else seems to be around. Someone has left goods for the market\n" +
           "standing by a small cart. These include apples, mushrooms, pears, and a few big\n" +
           "steaks. It looks like they left in a hurry, perhaps something scared them."

      if character.has?('piece of steak')
        puts "A big dog is here chewing on a steak. He seems quite content."
      else
        puts "A big, scary dog is here, growling at you and blocking your path over the draw-bridge.\n" +
             "He looks very hungry and his bark is very loud. Perhaps he will feel better if someone fed him."
      end
    end

    def interpret(rooms, action, character)
      if (action.include?('steak'))
        if (character.has?('steak') or character.has?('piece of steak'))
          puts "You are not that hungry, besides, you already have one!"
        else
          puts "You pick up a big piece of steak"
          character.give('steak')
        end
      elsif (action.include?('apple'))
        if (character.has?('apple'))
          puts "Perhaps someone else would like that apple. You already have one."
        else
          puts "You pick up a shiny red apple"
          character.give('apple')
        end
      elsif (action.include?('pear'))
        if (character.has?('pear'))
          puts "Having more than one pear might get messy. They are quite juicy."
        else
          puts "You take a juicy pear"
          character.give('pear')
        end
      elsif (action.include?('mushroom'))
        if (character.has?('muchroom'))
          puts "Planning on making some mushroom soup? One mushroom is enough for now."
        else
          puts "You take a small mushroom"
          character.give('mushroom')
        end
      elsif (action.include?('feed') or (action.include?('food'))) or (action.include?('steak') and action.include?('dog'))
        if character.has?('steak') or character.has?('piece of steak')
          puts "You carefully reach out and give a piece of steak to the dog. He loves you for it and starts chomping on it.\n" +
               "You pick up another steak just to have one handy, in case the dog becomes hungry again!"
          character.remove('steak')
          character.give('piece of steak')
        else
          puts "The dog won't like apples, pears or mushrooms, but you have nothing else to give him right now!"
        end
      elsif (action.include?('draw') or (action.include?('bridge')))
        if character.has?('piece of steak')
          puts "You briskly walk across the bridge and into the castle!\n" +
               "The bridge creaks underfoot and the view of the moat and the spectacular castle walls and portcullis is amazing!"
          character.change_location(rooms['Courtyard'])
        else
          puts "The dog growls at you angrily. You are not getting past him!"
        end
      else
        super(rooms, action, character)
      end
      character
    end
  end
end