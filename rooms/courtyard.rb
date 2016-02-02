module Adventure
  class Courtyard < Room
    def describe(character)
      puts "\nYou find yourself in the castle courtyard. People are buzzing about.\n" +
           "Carts ferrying fruits, goods and even manure are being pushed about.\n" +
           "Young ladies daintily skip about, with young boys having stick-sword fights.\n" +
           "The occasional dog slinks by, trying to avoid running into one of the many pairs\n" +
           "of legs about. On the far side of the courtyard, you see the captain of the guard\n" +
           "drilling his troops, and a cobblestone bridge leading across a stream and \n" +
           "into the forest. Straight ahead of you is the grand palace entrance, where a unit\n" +
           "of knights are blocking access into the palace."
    end

    def interpret(rooms, action, character)
      if (action.include?('palace') or action.include?('knight'))
        if (character.has?('palace pass'))
          puts "You show your palace pass to the group of knights, who nod approvingly and step aside to let you in."
          character.change_location(rooms['Palace'])
        else
          puts "The knights quickly step in front of you saying 'You are not permitted in there.\n" +
               "Only the king's most trusted knights and servants may enter, and those whom he invites.'"
        end
      elsif (action.include?('captain') and not(action.include?('ink')))
        if (character.has?('palace pass'))
          puts "The captain says, 'His majesties will be waiting for you in the palace. The knights\n" +
              "will honor the pass I gave you."
        else
          puts "The captain turns to you and says, 'Well met young adventurer. I have a message of\n" +
               "highest importance for the king, but it is not to be entrusted to anyone in the kingdom.\n" + 
               "You look like a trustworthy adventurer. Can you think of a way to get the message to the king\n" +
               "without anyone else seeing it?'"
        end
      elsif (action.include?('bridge') or action.include?('forest') or action.include?('cobble'))
        if (character.has?('parchment map'))
          puts "Taking another look at the map, you head off in the direction of the forest, \n" +
          "waving at the captain of the guard as you do so. The captain and his troops wave back."
          character.change_location(rooms['Bridge'])
        else
          puts "The forest looks big and beautiful. You could spend the whole day \n" +
          "wandering throug it. Perhaps someone can give you a map to help you find \n" +
          "your way."
        end    
      elsif (action.include?('invisible') or (action.include?('ink')))
        if (character.has?('invisible ink'))
          puts "You take the captain of the guard aside and show him your invisible ink. 'Remarkable!' he says, and quickly scribbles a message to the king on a palace pass. 'Show this palace pass to the knights at the entrance to the palace, and then show the king the invisible message in secret. It is of utmost importance!'"
          character.give('palace pass')
        else
          puts "You do not have invisible ink. You left it in the spy academy! Perhaps you can use the teleporter to get back there."
        end
      else
        super(rooms, action, character)
      end
      character
    end
  end
end