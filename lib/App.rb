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

  def self.all
    @@all
  end
end