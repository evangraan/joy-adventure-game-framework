require 'byebug'
require './rooms/room'
room_files = Dir["./rooms/*.rb"]
room_files.each {|file| require file }
require './character'

class Game
  attr_accessor :rooms
  attr_accessor :character

  def initialize
    @rooms = {}
    @rooms['Academy'] = Academy.new
    @rooms['SecretLab'] = SecretLab.new
    @rooms['TubeCar'] = TubeCar.new
    @character = Character.new(@rooms['Academy'])
    @character.identify(@rooms)
  end

  def run
    action = 'start'
    while (action != 'exit') do
      if not @character.location_seen
        @character.location.describe(@character) 
        @character.location_seen = true
      end
      puts "\n"
      action = @character.location.prompt
      puts "\n"
      @character = interpret(@rooms, action, @character) if action != 'exit'
      puts "\n"
    end

    filename = "saves/#{character.name.downcase}"
    data = { 'location' => @character.location.class,
             'inventory' => @character.inventory }
    File.open(filename,"w") do |f|
      f.write(data.to_json)
    end
  end

  def interpret(rooms, action, character)
    @character = @character.location.interpret(@rooms, action, @character)
  end
end

game = Game.new
game.run