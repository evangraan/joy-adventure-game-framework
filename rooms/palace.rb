module Adventure
  class Palace < Room
    def describe(character)
      if (character.has?('royal necklace'))
        puts "You take the necklace from your back-pack and hand it to the queen.\n" +
             "Tears well up in her eyes, and she exclaims: Adventurer '#{character.name}!\n" +
             "How can we thank you! You have saved our royal party and have restored our\n" +
             "faith in mankind! Where did you find our precious necklace?'\n" +
             "You tell them of your adventure, and as you relate encountering the troll,\n" +
             "the assembled subjects cheer at your victory. 'That beast has plagued us long enough!'\n" +
             "shouts the king. 'Thank you for teaching it a lesson. Captain of the guard, assemble\n" +
             "the troops! Let us follow up on #{character.name}'s victory and go chase it away!'\n" +
             "As you describe the thicket and revealed the culprits to be the crows, the queen\n" +
             "laughs and applauds your efforts. 'What a relief! Our thief is not one of our own,\n" +
             "but a crow! I'll have the window closed and the necklace restored to its place!\n" +
             "The queen then insists that you stay for the royal ball that evening, and you have\n" +
             "a marvellous time! As the evening draws to a conclusion, the king presents you with a\n" +
             "royal pass, granting you free access and his blessing anywhere in his kingdom. You thank\n" +
             "his royal highness and bid the kingdom farewell. As a super spy, the time has come for you\n" +
             "to report back on your mission and take on a new adventure. You should now 'teleport to Secretlab'"
       character.give('royal pass')
      elsif (character.has?('crow feather'))
        puts "The palace citizens talk in hushed tones about your amazing \n" +
        "climb up the palace wall. You hear the words 'amazing!' and 'wondrous!' \n" +
        "mentioned more than once. The king smiles at you briefly and then returns \n" +
        "to the affairs of the day. He is sure to wish you well on your quest to find \n" +
        "the necklace.\n" +
        "You can leave the palace through the entrance archway should you so choose."
      else
        puts "As you enter the king's palace, two heralds quickly \n" +
        "step to your side and escort you through the throng of people \n" +
        "awaiting an audience with the king. The first raises his trumpet \n" +
        "and heralds your entrace, whilst the second announces you in a loud \n" +
        "and respectful voice. 'Royal adventurer extraordinary, the brave, \n" +
        "the spectacular, the wise, the courageous, #{character.name} !!\n\n" +
        "There is applause from the subjects assembled, and they part before \n" +
        "you, allowing you to step up to the king and queen.\n\n" +
        "The king is majestic, his richly embroidered robes draped around him \n" +
        "flows like water to the marble palace floors. The jeweled crown on his \n" +
        "head, inlaid with precious stones and lined with gold sparkles and \n" +
        "catches the light as he moves his head to look at you.\n\n" +
        "Next to him, her royal majesty the queen gives you a warm smile. Her \n" +
        "dress is extravagantly beautiful, intricate sequins portraying the \n" +
        "loveliest of creatures, including a cheetah at play in a meadow, resplendent \n" +
        "with a motif of birds and flowers.\n\n" +
        "The king says, 'Ahh! Adventurer #{character.name}! What a pleasure \n" +
        "and honour to see you! Our kingdom has been in need of one like you, \n" +
        "for our most precious crown jewel necklace has disappeared! Can you help us?\n"
      end
    end

    def interpret(rooms, action, character)
      if (action.include?('jewel') or action.include?('saw') or action.include?('see') or action.include?('king') or action.include?('queen') or action.include?('what') or (action.include?('necklace') and not (character.has?('royal necklace'))))
        puts "The king concentrates and tries to remember. He stares at the glass pedestal \n" +
        "where the precious necklace was housed. 'The queen would wear it only on the most\n" +
        "special of occations. That fateful morning we were preparing for a grand ball, \n" +
        "and the pages were preparing the ballroom for the party. When the queen arrived \n" +
        "to retrieve the necklace, she found it missing and the glass casing shattered on \n" +
        "the floor. We are all so worried, we are afraid we might have a thief in the kingdom!'\n\n" +
        "At this announcement all those assembled draw in their breath from shock. In this peaceful\n" +
        "kingdom such a thing is unthinkable!\n\n" +
        "The queen gracefully shifts her gaze you. #{character.name}, I did notice a few black \n" +
        "feathers lying next to the pedestal, and one of the very top windows were open. Perhaps \n" +
        "this offers you a place to start your investigation. Please help us find our necklace!"
      elsif (action.include?('window') or action.include?('grappling') or action.include?('hook'))
        if (character.has?('grappling hook'))
          puts "To the amazement of the assembled court-goers, you swing your grappling hook... once...\n" +
          "twice... three times, aim and let GO ! It flies through the air, catches on the edge of the window,\n" +
          "bounces once and drops off the outside. You gently pull back on the rope until you feel \n" +
          "the hook catch securely. To startled gasps and gawks from the people below, you confidently \n" +
          "start up the wall, one foot after the other, until you reach the window high up on the wall,\n" +
          "pulling yourself onto the window sill."
          character.change_location(rooms['Window'])
        else
          puts "Looking at the window, you realize it is too high to reach, unless you \n" +
          "had some climbing gear."
        end
      elsif (action.include?('feather') and character.has?('crow feather'))
        puts "The queen briefly examines the feather. 'Ahh, yes, I saw feathers just like these.\n" + 
        "I hope they help you in your quest!"
      elsif (action.include?('crow'))
        puts "One of the heralds tap you on the shoulder and says, 'I know a place \n" +
        "in the forest where a colony of black crows have lived for many years. They are \n" +
        "such a nuisance to the community. They take any shiny object they can find. \n" +
        "I can draw you a map to their colony if it will help?"
      elsif (action.include?('map') and not(character.has?('parchment map')))
        puts "You ask whether you may have a map to the crows' colony, and the herald\n" +
        "draws you one on an official looking parchment."
        character.give('parchment map')
      elsif action.include?('feather') or action.include?('glass')
        puts "The feathers and glass have been cleaned up since. The queen just shakes her\n" +
        "head sadly at the thought of the lost royal necklace."
      elsif action.include?('leave') or action.include?('entrance') or action.include?('arch')
        puts "You wave at your dear friends in the palace and walk back to the courtyard."
        character.change_location(rooms['Courtyard'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end