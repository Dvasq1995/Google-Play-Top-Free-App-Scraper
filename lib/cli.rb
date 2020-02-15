class Command_Line_Interface
  BASE_PATH = "https://play.google.com/store/apps/top?hl=en_US"
  
  def run
    puts "These are the top 10 Free Google Play Apps:\n"
    make_apps
    display_apps
    app_info
  end
  
  def make_apps
    if App.all.empty?
      Scraper.scrape_page(BASE_PATH)
    end
  end
  
  def display_apps
    App.all.map.with_index do |app, i|
      puts "#{i + 1}. #{app.name} - #{app.description}\n"
    end
    
  end
  
  def app_info
    puts "\nSelect app (1-10) to get more information\n"
    input = gets.strip.to_i
    
    if input >= 1 && input <= 10
      app = App.all[input - 1]
      app.update
    else
      puts "Wrong input"
      app_info
    end
    
    puts "\n#{app.name}\nDeveloper: #{app.developer}\nDescription: #{app.long_description}\n"
    
    puts "\nWould you like to check out another app?(Y/N)\n"
    input = gets.strip.downcase
    if input == 'y' || input == 'yes'
      run
    else
      Kernel.exit
    end
  end
end