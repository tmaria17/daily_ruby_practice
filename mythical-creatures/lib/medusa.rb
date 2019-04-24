require_relative '../lib/person'
require 'pry'

class Medusa
  attr_reader :name, :statues
  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    if @statues.count >= 3
      @statues.first.unstone
      @statues.shift
      @statues.push(victim)
      victim.become_stoned
    else
      @statues.push(victim)
      victim.become_stoned
    end
  end

end
