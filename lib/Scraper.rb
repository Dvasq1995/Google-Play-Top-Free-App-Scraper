require 'pry'
require 'open-uri'

class Scraper
  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    apps = []
    apps
  end
end
binding.pry