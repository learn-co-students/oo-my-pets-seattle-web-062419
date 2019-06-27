class Owner

  attr_reader :name, :species
  attr_accessor :mood

  @@all = []
  @@dogs = []
  @@cats = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def species
    @species
  end

  def cats
    @@cats
  end

  def dogs
    @@dogs
  end

  def say_species
     "I am a #{self.species}."
  end

  def buy_dog(pet_name)
    @@dogs << Dog.new(pet_name, @name)
  end

  def buy_cat(pet_name)
    @@cats << Cat.new(pet_name, @name)
  end

  def walk_dogs
    Dog.all.each { |x| x.mood = "happy" }
  end

  def feed_cats
    Cat.all.each { |x| x.mood = "happy" }
  end

  def list_pets
    "I have #{Dog.all.count} dog(s), and #{Cat.all.count} cat(s)."
  end

  def sell_pets
    Dog.all.each { |x|
    x.mood = "nervous"
    x.owner = nil
  }
    Cat.all.each { |x|
    x.mood = "nervous"
    x.owner = nil }
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

end