require_relative './config/environment'

def reload!
    load_all './lib'
end

task :console do
    Pry.start
end

task :scrape_rooms do
    # instantiate a new scraper, and then have it find new rooms
    nyc_scaper = RoomScraper.new("https://provo.craigslist.org/d/rooms-shares/search/roo")
    nyc_scaper.call

    
    # after this method call, I should be able to say Room.all and have rooms there
end