module Adventure
  class Tubecar < Room
    def describe(character)
      puts "\nThe car is small and built for speed. There is a big green 'GO' button and lights flash at seemingly random intervals on the dashboard. There is no steering wheel, and no seat-belt. When you got in, a strong glass dome closed over your seat. You feel safe and excited for a speedy journey!"
    end

    def interpret(rooms, action, character)
      super(rooms, action, character)
      character
    end
  end
end