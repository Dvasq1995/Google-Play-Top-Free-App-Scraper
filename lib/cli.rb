require 'pry'

class Command_Line_Interface
  url = "https://play.google.com/store/apps/top?hl=en_US"
  
  def run
    make_apps
  end
  
  def make_apps
    Scraper.scrape_index_page(url)
  end
  
  def display_apps
    App.map.with_index do |app, i|
      puts "#{i + 1}#{app.name}\n"
    end
  end
end