require 'pry'

class Command_Line_Interface
  url = "https://play.google.com/store/apps/top?hl=en_US"
  
   def run
    make_apps
    add_attributes_to_apps
  end

  def make_apps
    apps_array = Scraper.scrape_index_page(url)
    App.create_from_collection(apps_array)
  end
end