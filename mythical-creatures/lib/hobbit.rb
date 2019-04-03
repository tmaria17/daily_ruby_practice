class Hobbit
  attr_reader :name, :disposition, :age
  def initialize(name, disposition = "homebody")
    @name = name
    @disposition = disposition
    @age = 0
  end

  def is_short?
    true
  end

  def has_ring?
    @name == "Frodo"
  end

  def old?
    @age > 100
  end
  def adult?
    @age > 32
  end

  def celebrate_birthday
    @age += 1
  end
end
