class Centaur
  attr_reader :name, :breed
  def initialize(name, breed)
    @name = name
    @breed = breed
    @crank_factor = false
    @position = "standing"
    @activity_meter = 0
  end

  def drink_potion
    if @activity_meter == 0
      "I've fallen ill! :("
    elsif standing?
      @activity_meter = 0
    else
      "NO!"
    end
  end

  def stand_up
    @position = "standing"
  end

  def laying?
    @position == "laying"
  end

  def lay_down
    @position = "laying"
  end

  def sleep
    if standing?
      "NO!"
    else
      @activity_meter = 0
    end
  end

  def standing?
    @position == "standing"
  end

  def cranky?
    check_crank
  end

  def check_crank
    if @activity_meter > 2
      @crank_factor = true
    else
      @crank_factor = false
    end
  end

  def run
    if @activity_meter < 3 && @position == "standing"
      @activity_meter += 1
      "Clop clop clop clop!!!"
    else
      "NO!"
    end
  end

  def shoot
    if @activity_meter < 3 && @position == "standing"
      @activity_meter+= 1
      "Twang!!!"
    else
      "NO!"
    end
  end
end
