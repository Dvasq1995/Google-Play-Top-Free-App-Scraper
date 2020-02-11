require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper
  def scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    apps = []
    index_page.each_with_index do |app, index|
      app_name = app.css("div.WsMG1c.nnK0zc")[index].text
      app_developer = app.css("div.KoLSrc")[index].text
      app_description = app.css("div.b8cIId.f5NCO")[index].text
      apps << {name: app_name, developer: app_developer, description: app_description}
    end
    puts apps
  end
  binding.pry
end