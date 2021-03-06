module Adventure
  class Academy < Room
    def describe(character)
      puts "\nYou find yourself in the super secret spy academy room.\n" +
           "This is where you get your instructions for missions.\n" +
           "A finely crafted and expensive couch stands in the middle of the\n" +
           "room, on an expensive and beautiful persian carpet. Against the wall\n" +
           "opposite the couch, a bookshelf is fully packed with books. These have\n" +
           "interesting titles, such as 'the art of war' and 'political climates\n" +
           "in third world countries'. One of the books catch your eye. Its title\n" +
           "is 'Alice in wonderland' and it looks like it has been read many times."
    end

    def interpret(rooms, action, character)
      if (action.include?('read') or
          action.include?('book') or
          action.include?('alice') or
          action.include?('wonderland'))
        puts "As you pull the book from the shelf, the bookshelf slides open!"
        character.change_location(rooms['Secretlab'])
      else
        super(rooms, action, character)
      end
      character
    end
  end
end