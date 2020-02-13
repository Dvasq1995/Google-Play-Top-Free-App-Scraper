require 'open-uri'
class Scraper
  BASE_URL = 'https://play.google.com'
  def self.scrape_page(index_url)
    index_page = Nokogiri::HTML(open(index_url).read, nil, 'utf-8')

    row = index_page.css('div.Ktdaqe').detect do |e|
      e.css('h2').text == "Top Free Apps"
    end
    
    app_elements = row.css('div.WHE7ib.mpg5gc')
    
    app_hashes = app_elements.map do |el|
       app_hash = {}
       app_hash[:name] = el.css("div.WsMG1c.nnK0zc").text
       app_hash[:developer] = el.css("a div.KoLSrc").text
       app_hash[:description] = el.css("div.b8cIId.f5NCO").text
       app_hash[:url] = BASE_URL + el.css('div.b8cIId.ReQCgd.Q9MA7b a').attr('href').value
       app_hash[:long_description] = ''
       app_hash
    end
     
     App.create_from_collection(app_hashes)
  end
  
  def self.update(app)
    app_page = Nokogiri::HTML(open(app.url).read, nil, 'utf-8')
      app.long_description = app_page.css('div.DWPxHb').text
  end
end
