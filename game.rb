require './rooms/room'
require './rooms/academy'
require './rooms/secret_lab'
require './rooms/tube-car'
require './character'
require 'byebug'

class Game
  attr_accessor :rooms
  attr_accessor :character

  def initialize
    @rooms = {}
    @rooms['academy'] = Academy.new
    @rooms['secret-lab'] = SecretLab.new
    @rooms['tube-car'] = TubeCar.new
    @character = Character.new(@rooms['academy'])
    @character.identify
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
  end

  def interpret(rooms, action, character)
    @character = @character.location.interpret(@rooms, action, @character)
  end
end

game = Game.new
game.run