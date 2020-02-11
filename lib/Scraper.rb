require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper
  def scrape_index_page(index_url)
   index_page = Nokogiri::HTML(open(index_url))
   apps = []
   app_list = index_page.css("div.ZmHEEd").select {|app| app.css()}
  end
end
binding.pry