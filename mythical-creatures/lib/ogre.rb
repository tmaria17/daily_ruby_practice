require 'pry'
class Ogre
  attr_reader :name, :home, :swings
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @swings = 0
  end

  def apologize(human)
    human.knocked_out_state = false
  end
  def swing_at(human)
      @swings += 1
  end

  def encounter(human)
    if human.encounter_counter > 1 && human.encounter_counter % 2 == 0
      swing_at(human)
      human.knocked_out_state = true
      human.encounter_counter += 1
    else
      human.encounter_counter += 1
    end
  end
end

class Human
  attr_reader :name
  attr_accessor :encounter_counter, :knocked_out_state
  def initialize
    @name = "Jane"
    @encounter_counter = 0
    @knocked_out_state = false
  end

  def knocked_out?
    @knocked_out_state
  end

  def notices_ogre?
    @encounter_counter % 3 == 0
  end
end
