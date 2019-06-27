require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner

  attr_reader :species, :name
  attr_accessor :cats, :dogs
  @@all = []
  
  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
    @cats = []
    @dogs = []
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end 

  def buy_cat(name)
    newCat = Cat.new(name, self)
  end

  def buy_dog(name)
    newDog = Dog.new(name, self)
  end

  def walk_dogs
    @dogs.each do |dog|
      dog.mood = "happy"
    end
  end 

  def feed_cats
    @cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets_of_type(type_array)
    type_array.each_with_index do |pet, index|
      pet.owner = nil
      pet.mood = "nervous"
      type_array.delete_at(index)
    end
  end

  def sell_pets
    sell_pets_of_type(@cats)
    sell_pets_of_type(@dogs)
  end


  def list_pets 
    "I have #{@dogs.size} dog(s), and #{@cats.size} cat(s)."
  end 
end

h = Owner.new("h")
h.buy_cat("a")
h.buy_dog("a")
h.buy_dog("b")
h.walk_dogs
puts h.dogs[0].mood
h.sell_pets