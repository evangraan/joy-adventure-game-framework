require 'byebug'
require './rooms/room'
room_files = Dir["./rooms/*.rb"]
room_files.each {|file| require file }
require './character'

module Adventure
  class Game
    attr_accessor :rooms
    attr_accessor :character

    def initialize
      @rooms = load_rooms
      @character = Character.new(@rooms['Academy'])
      @character.identify(@rooms)
    end

    def run
      action = 'start'
      while (action != 'exit') do
        @character, action = play(@character)
      end
      @character.save
    end

    private

    def play(character)
      character = describe_location_to_character(character)
      action = character.prompt
      character = act(character, action)
      return character, action
    end

    def act(character, action)
      puts "\n"
      character = interpret(@rooms, action, character) if action != 'exit'
      puts "\n"
      character
    end

    def interpret(rooms, action, character)
      character.interpret(rooms, action, character)
    end

    def describe_location_to_character(character)
      character = describe_location_to_character_if_not_already_seen(character)
      puts "\n"
      character
    end

    def describe_location_to_character(character)
      if not character.location_seen
        character.location.describe(@character) 
        character.location_seen = true
      end 
      character
    end

    def load_rooms
      @rooms = {}
      @rooms = load_defined_rooms(@rooms)
    end

    def load_defined_rooms(rooms)
      Dir["./rooms/*.rb"].each do |filename|
        room = File.read(filename)[/class (.*) < Room/]
        @rooms = load_room_if_present(rooms, room)
      end
      @rooms
    end

    def load_room_if_present(rooms, room)      
      load_room(rooms, room) if room
    end

    def load_room(rooms, room)
      room = room.gsub("class ", "").gsub(" < Room", "")
      rooms[room] = Object::const_get("Adventure::#{room}").new
      rooms
    end
  end
end

game = Adventure::Game.new
game.run