require 'pry'
class Owner
  attr_accessor :cat, :dog
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    save
  end
  
  def save
    @@all << self
  end 
  
  def self.all
    @@all 
  end 
  
  def self.count
    @@all.count
  end 
  
  def self.reset_all
    @@all.clear
  end 
  
  def say_species
    "I am a human."
  end 
  
  def cats
    binding.pry
    Cat.all.each {|cat| cat.name}
  end 
  
  def dogs 
    @dogs.each {|dog| dog.name}
  end
  
  def buy_cat(name)
    cat = Cat.new(name, self)
    @cats << cat
  end 
  
  def buy_dog(name)
    dog = Dog.new(name, self)
    @dogs << dog 
  end
  
  def feed_cats
    @cats.map {|cat| cat.mood = "happy"}
  end 
  
  def walk_dogs
    @dogs.map {|dog| dog.mood = "happy"}
  end
  
  def sell_pets
    @cats.map do |cat|
      cat.mood = "nervous"
    end
    
    @dogs.map do |dog|
      dog.mood = "nervous"
    end 
  end
  
  def list_pets
    dog_counter = 0 
    cat_counter = 0
    @cats.each {|cat| cat_counter += 1}
    @dogs.each {|dog| dog_counter += 1}
    "I have #{dog_counter} dog(s), and #{cat_counter} cat(s)."
  end  
end