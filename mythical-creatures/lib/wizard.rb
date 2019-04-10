class Wizard
  attr_reader :name
  def initialize(name, bearded = "")
    @name = name
    @bearded = bearded
    @spells_cast = 0
  end

  def bearded?
    if @bearded != ""
      @bearded[:bearded]
    else
      true
    end
  end

  def incantation(spell)
    "sudo #{spell}"
  end

  def rested?
    @spells_cast < 3
  end

  def cast
    @spells_cast += 1
    "MAGIC MISSILE!"
  end
end
