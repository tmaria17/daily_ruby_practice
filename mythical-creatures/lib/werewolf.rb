class Werewolf
  attr_reader :name, :location
  def initialize(name, location = "London")
    @name = name
    @location = location
    @form = "human"
    @hunger = false
  end

  def consume(victim)
    if @form == "human"
      "Cannibalism isn't cool dude."
    else
      @hunger = false
      victim.status = :dead
    end
  end

  def hungry?
    @hunger
  end

  def change!
    if @form == "human"
      @form = "werewolf"
      @hunger = true
    else
      @form = "human"
    end
  end

  def human?
    @form == "human"
  end

  def wolf?
    @form == "werewolf"
  end
end
