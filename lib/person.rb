# your code goes here
require 'pry'
class Person

  # Use attr_reader for name since we do not want to change that name ever
  # use attr_reader for happiness, hygiene since we overwrite those methods
  # Use attr_accessor for bank_account since that number is constantly changing
  
  attr_accessor :bank_account
  attr_reader :name, :happiness, :hygiene

  # instance variable declaration
  def initialize(name)
    @name = name
    @bank_account = 25
    @happiness = 8
    @hygiene = 8
  end


  # overwritten methods for happiness and hygiene that allow us to monitor the
  # levels of happiness and hygiene and keep them between 0 and 10 so nothing
  # bad happens
  def happiness=(happiness)
    @happiness = happiness
    if @happiness > 10
      @happiness = 10
    elsif @happiness < 0
      @happiness = 0
    end
  end


  def hygiene=(hygiene)
    @hygiene = hygiene
    if @hygiene > 10
      @hygiene = 10
    elsif @hygiene < 0
      @hygiene = 0
    end
  end

  # ternary operator yay
  def clean?
    @hygiene > 7 ? true : false
  end

  # tern tern ternary
  def happy?
    @happiness > 7 ? true : false
  end

  # Can use instance variable since we do not have a custom write method
  # and are just calling this instance variable instantiated from the
  # attr_accessor macro
  def get_paid(salary)
    @bank_account += salary
    return "all about the benjamins"
  end

  # use self since we created our own write method for hygiene
  def take_bath
    self.hygiene += 4
    return "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.happiness += 2
    self.hygiene -= 3
    return "♪ another one bites the dust ♫"
  end

  # Not entirely sure why we don't use the two if statements there that I have
  # commented out
  def call_friend(friend)
    self.happiness += 3
    friend.happiness += 3
    # if friend.name == "Felix"
    #   if self.name == "Stella"
        return "Hi #{friend.name}! It's #{self.name}. How are you?"
    #   end
    # end
  end

  def start_conversation(convo_starter, topic)
    # binding.pry
    if topic == "politics"
      # binding.pry
      self.happiness -= 2
      convo_starter.happiness -= 2
      return "blah blah partisan blah lobbyist"
    elsif topic == "weather"
      self.happiness += 1
      convo_starter.happiness += 1
      return "blah blah sun blah rain"
    else
      return "blah blah blah blah blah"
    end
  end
end
