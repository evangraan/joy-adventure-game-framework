module Adventure
  class Clouds < Room
    def describe(character)
      puts "Your thirst for adventure is rewarded! Just as you untangle the kite from\n" +
           "the tree, a strong gust of wind lifts the kite high into the air. You hold on\n" +
           "tightly as the kite is lifted higher, and higher, the wind sweeping you up along\n" +
           "with it. You see the kingdom's beautiful country-side mapped out below, the\n" +
           "farm-lands small and closely packed, like a patch-work quilt. A surprised crow\n" +
           "squaks at you as you drift by it, and hastily darts away. Using your spy-skills\n" +
           "you might be able to steer the kite towards the palace."
    end

    def interpret(rooms, action, character)
      if (action.include?('steer') or action.include?('fly') or action.include?('palace'))
        puts "You remember your spy training. You spent hours mastering parachutes and\n" +
             "aeroplanes. Carefully steering the kite towards the palace, you make an\n" +
             "expert landing through the same open window that you climbed up to using your\n" +
             "grappling hooks. The whole palace is amazed and gasps with excitement as you\n" +
             "soar through the window and land squarely in front of the king and queen, light\n" +
             "on your feet and as balanced as a cat."
        character.change_location(rooms['Palace'])
      else
        super(rooms, action, character)        
      end
      character
    end
  end
end