require_relative "../lib/Scraper.rb"
require_relative "../lib/App.rb"
require 'nokogiri'

class Command_Line_Interface
  BASE_PATH = "https://play.google.com/store/apps/top?hl=en_US"
  
  def run
    puts "These are the top 10 Free Google Play Apps:\n"
    make_apps
    display_apps
    app_info
  end
  
  def make_apps
    Scraper.scrape_page(BASE_PATH)
  end
  
  def display_apps
    App.all.map.with_index do |app, i|
      puts "#{i + 1}. #{app.name} - #{app.description}\n"
    end
  end
  
  def app_info
    puts "\nSelect app (1-10) to get more information\n"
    input = gets.strip.to_i
    app = App.all[input - 1]
    puts "\n#{app.name}\nDeveloper: #{app.developer}\nDescription: #{app.long_description}"
  end
end