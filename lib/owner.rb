class Owner
  # code goes here
  attr_accessor 
  attr_reader  :species, :name
  @@all=[]
  def initialize(name)
    @name = name
    @species="human"
    @@all << self
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end   
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end   
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end  
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood ="nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

  end


  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all=[]
  end
  
  def species
    @species
  end

  def say_species
    "I am a #{self.species}."
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end  
end