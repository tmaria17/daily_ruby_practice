gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/werewolf'

class WerewolfTest < Minitest::Test
  def test_it_has_a_name
    werewolf = Werewolf.new("David")
    assert_equal "David", werewolf.name
  end

  def test_it_has_a_location
    werewolf = Werewolf.new("David","London")
    assert_equal "London", werewolf.location
  end

  def test_it_is_by_default_in_human_form
    werewolf = Werewolf.new("David","London")
    assert werewolf.human?
  end

  def test_when_starting_as_a_human_changing_means_it_is_no_longer_human
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    refute werewolf.human?
  end

  def test_when_starting_as_a_human_changing_turns_it_into_a_werewolf
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.wolf?
  end

  def test_when_starting_as_a_human_changing_a_second_time_it_becomes_human_again
    werewolf = Werewolf.new("David","London")
    assert werewolf.human?
    werewolf.change!
    werewolf.change!
    assert werewolf.human?
  end

  def test_when_starting_as_a_werewolf_changing_a_second_time_it_becomes_werewolf_again
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.wolf?
    werewolf.change!
    werewolf.change!
    assert werewolf.wolf?
  end

  def test_is_not_hungry_by_default
    werewolf = Werewolf.new("David","London")
    refute werewolf.hungry?
  end

  def test_becomes_hungry_after_changing_to_a_werewolf
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.hungry?
  end

  class Victim
    attr_accessor :status

    def initialize
      @status = :alive
    end
  end

  def test_consumes_a_victim
    victim = Victim.new
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.hungry?
    werewolf.consume(victim)
    refute werewolf.hungry?
  end

  def test_cannot_consume_victim_if_in_human_form
    victim = Victim.new
    werewolf = Werewolf.new("David","London")

    assert_equal "Cannibalism isn't cool dude.", werewolf.consume(victim)

  end

  def test_a_werewolf_who_has_consumed_a_victim_is_no_longer_hungry
    victim = Victim.new
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.hungry?
    werewolf.consume(victim)
    refute werewolf.hungry?
  end

  def test_a_werewolf_who_has_consumed_a_victim_makes_the_victim_dead
    victim = Victim.new
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    werewolf.consume(victim)

    assert :dead, victim.status
  end

end
