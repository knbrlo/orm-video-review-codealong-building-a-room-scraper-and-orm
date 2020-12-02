class RoomScraper

    def initialize(index_url)
        @index_url = index_url
        @doc = Nokogiri::HTML(open(index_url))
    end

    def call
        rows.each do |row_doc|
            Room.create_from_hash(scrape_row(row_doc))
        end
    end

    private
    def rows
        @rows ||= @doc.search(".rows li")
    end

    def scrape_row(row)
        {
            :date_created => row.search("time").attribute("datetime").text,
            :title => row.search(".result-title").text,
            :url => "#{@index_url}#{row.search(".result-title").attribute("href").value}",
            :price => row.search("span.result-price").text,
        }
    end


end