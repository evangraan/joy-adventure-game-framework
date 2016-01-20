module Adventure
  class Secretlab < Room
    def describe(character)
      puts "You are in a secret laboratory! A large table and shelves are stacked with spy gear and cool things, such as grappling hooks, night vision goggles, pens that explode when you click them, invisible ink, small computers and a big red button. On the table lies a secret envelope with #{character.name} written on in! It must be a new mission! Next to the envelope is a strange device that labeled 'teleporter'"
    end

    def interpret(rooms, action, character)
      if (action.include?('envelope') or action.include?('open') or action.include?('read'))
        puts "The letter reads: 'Your mission, if you choose to accept it, is to travel to the the land far away and over the hills, and meet with the prince prince and princess who are its rulers.  They will give you top secret information about what they saw. Use this information to find the country's precious necklace, rumoured to be magical in nature. "
      elsif (action.include?('pen'))
        if character.has?('explosive pen')
          puts "You've already taken a pen. For the fun of it. you click another one. *BOOM* !!"
        else
          puts "You click one of the pens and stand back. *BOOM* it explodes with a loud BANG! You decide to put another one in your pocket."
          character.give('explosive pen')
        end
      elsif (action.include?('grap') or action.include?('hook'))
        if character.has?('grappling hook')
          puts "You already have a grappling hook. There is not enough room in your pocket for another one."
        else
          puts "You take one of the grappling hooks and put it in your pocket."
          character.give('grappling hook')
        end
      elsif (action.include?('night') or action.include?('vision') or action.include?('goggles'))
        if character.has?('night-vision goggles')
          puts "You already have night vision goggles. Another pair won't help you see any better at night."
        else
          puts "You put on a pair of night-vision goggles and the room looks green. Neat. You take the off and sling them around your neck."
          character.give('night-vision goggles')
        end
      elsif (action.include?('invisible') or action.include?('ink'))
        if character.has?('invisible ink')
          puts "One vial is enough."
        else
          puts "You carefully pick up a vial of invisible ink. Don't drop it, how will you find it again?"
          character.give('invisible ink')
        end
      elsif (action.include?('small') or action.include?('computer'))
        if character.has?('small computer')
          puts "More computing power won't help you here."
        else
          puts "The small computer beeps as you pick it up. This may be handy later, so you decide to keep one."
          character.give('small computer')
        end
      elsif (action.include?('push') or action.include?('red') or action.include?('button'))
        puts "With a !!WOOSH!! a panel in the wall slides open and reveals a mega fast looking tube car and a tunnel stretching into the distance. The destination dial says 'to the land far, far away and over the hills'. You get in."
        character.change_location(rooms['Tubecar'])
      elsif (action.include?('teleport') and (not action.include?('teleport to')))
        if character.has?('teleportation device')
          puts "You already have one. Its energy cell will last for years, you don't need another."
        else
          puts "The teleportation device softly hums and is warm to the touch. It must have quite a powerful energy cell. You put it in your back pocket."
          character.give('teleportation device')
        end
      else
        super(rooms, action, character)
      end
      character
    end
  end
end