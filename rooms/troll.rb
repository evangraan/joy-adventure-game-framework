module Adventure
  class Troll < Room
    def describe(character)
      if character.has?('necklace')
        puts "\nThe troll peers over the side of the bridge. He is too scared\n" +
             "to climb back on, in case you have more of the exploding pens.\n" +
             "He emits a low rumble and his eyes widen when he sees you carrying\n" +
             "the beautiful necklace."
      elsif character.has?('discharged pen')
        puts "\nThe troll is back on the bridge, but the moment he sees you, he quickly\n" +
             "dives over the side of the bridge. He makes a large 'plop' and 'splash' in the\n"
             "river. You smile to yourself and are thankful for your wonderful spy gadgets.\n"
      else
        puts "\nA menacing troll jumps onto the bridge. He has drool dripping\n" +
             "from his mouth and he roars a fiercesome roar. It looks as though he\n" +
             "is ready to pounce on you. You better be careful. You certainly cannot\n" +
             "cross the bridge while he is blocking your way.\n"
      end
      puts "If you keep south you will reach the other side of the bridge, on your\n" +
           "way to the courtyard. From here you can also go north, towards the forest."
    end

    def interpret(rooms, action, character)
      if (action.include?('pen'))
        if character.has?('explosive pen')
          puts "You remember the words of the adventurer. The troll does not like loud\n" +
               "noises! You click the explosive pen and toss it at the troll. The troll is curious\n" +
               "at first, but then with a *BOOM!* the pen explodes. The troll covers his ears and dives\n" +
               "into the river. You've scared him off!!"
          character.give('discharged pen')
          character.remove('explosive pen')
        else
          puts "You search your backpack for an explosive pen. You do not seem to have any."
        end
      elsif (action.include?('troll') or action.include?('shout'))
        puts "You take a tentative step towards the troll, shouting at him, and he rears up and swipes his arm at you.\n" +
             "You dodge and jump out of the way, but he is still blocking your way across to the forest."
      elsif (action.include?('bridge') or action.include?('run') or action.include?('court') or action.include?('yard') or action.include?('escape') or action.include?('south'))
        puts "You make your escape back to the start of the bridge."
        character.change_location(rooms['Bridge'])
      elsif (action.include?('swim') or action.include?('river'))
        puts "The river is cold and wet. You'd ruin your spy equipment if you jumped in. There must be a way to scare the troll off."
      elsif (action.include?('forest') or action.include?('north'))
        if character.has?('discharged pen')
          puts "You cross the bridge into the forest."
          character.change_location(rooms['Forest'])
        else
          puts "The troll growls at you as you make a move forward. You cannot get across while he is here\n"
        end
      else
        super(rooms, action, character)
      end
      character
    end
  end
end