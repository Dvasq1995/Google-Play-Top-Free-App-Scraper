require_relative "../lib/Scraper.rb"
require_relative "../lib/App.rb"
require 'nokogiri'

class Command_Line_Interface
  BASE_PATH = "https://play.google.com/store/apps/top?hl=en_US"
  
  def run
    make_apps
    display_apps
  end
  
  def make_apps
    Scraper.scrape_page(BASE_PATH)
  end
  
  def display_apps
    App.all.map.with_index do |app, i|
      puts "#{i + 1}. #{app.name}\n"
    end
  end
end