class Pirate
  attr_reader :name, :job, :booty
  def initialize(name, job ="Scallywag")
    @name = name
    @job = job
    @heinous_act_counter = 0
    @booty = 0
  end

  def cursed?
    @heinous_act_counter >= 3
  end

  def commit_heinous_act
    @heinous_act_counter +=1
  end

  def rob
    @booty += 100
  end
end
