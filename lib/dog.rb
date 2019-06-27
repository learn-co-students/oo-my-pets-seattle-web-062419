class Dog
  attr_reader :name
  attr_accessor :mood, :owner

  @@all = []

  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    @owner = owner
    owner.dogs << self
    @@all << self
  end

  def self.all
    @@all
  end
end