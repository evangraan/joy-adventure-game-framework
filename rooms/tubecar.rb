module Adventure
  class Tubecar < Room
    def describe(character)
      puts "\nThe car is small and built for speed. There is a big green 'GO' button and lights flash at seemingly random intervals on the dashboard. There is no steering wheel, and no seat-belt. When you got in, a strong glass dome closed over your seat. You feel safe and excited for a speedy journey!"
    end

    def interpret(rooms, action, character)
      if (action.include?('push') or action.include?('button') or action.include?('go'))
        puts "You hear a loud wooshing noise, like someone sucking very hard on a lolli-pop, and then the tube car starts moving, slowly at first. You think to yourself, 'this is not fast at all,' but as you finish the thought, the car accellerates and accelerates and accelerates until you are pressed with your back firmly against the seat. You try and take a deep breath, but can only manage a small gulp of air, since the car is now moving so fast, that the air rushes by your face before you can breathe much of it. A turn comes up ahead and before you can brace yourself, you've taken the turn, and two more. Left, right, left, left. Suddenly you emerge from the tunnel and trees are flashing by in a blur. The sounds of the forest blend into an ongoing cacophony, a pleasant background hum. Then, just as you start getting used to travelling at this speed, the car slows down rapidly and comes to a smooth, but rapid stop."
        character.change_location(rooms['Castle'])        
      else
        super(rooms, action, character)
      end
      character
    end
  end
end