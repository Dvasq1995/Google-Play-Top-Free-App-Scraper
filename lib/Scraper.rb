require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper
  def scrape_index_page(index_url)
   index_page = Nokogiri::HTML(open(index_url))
   apps = []
   index_page.css("div.b8cIId.ReQCgd").each do |app|
     app_name = "#{app.css("div.WsMG1c.nnK0zc").text}"
     app_developer = "#{app.css("div.KoLSrc").text}"
     app_description = "#{app.css("div.b8cIId.f5NCO")}"
   end
  end
end
binding.pry