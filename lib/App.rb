require 'pry'
class App
  attr_accessor :name, :developer, :description

  @@all = []

  def initialize(app_hash)
    app_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end
  
  def self.create_from_collection(apps_array)
    apps_array.each do |app_hash|
      App.new(app_hash)
    end
  end

  def self.all
    @@all
  end
end