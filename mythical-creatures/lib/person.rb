require_relative '../lib/medusa'

class Person
  attr_reader :name, :stone
  def initialize(name)
    @name = name
    @stone = false
  end

  def become_stoned
    @stone = true
  end

  def unstone
    @stone = false
  end

  def stoned?
    @stone
  end
end
