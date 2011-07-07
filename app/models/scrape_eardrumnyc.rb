require 'rss'
require 'chronic'

class ScrapeEardrumnyc

  def self.scrape_row(day_number, row_number)
    rv = []
    #row number offset from 0 by 2, except for first day (offset is 3)
    if (day_number == 0)
      row_number += 3
    else
      row_number += 2
    end
      
    #day numbers offset from 0 by 2
    day_number += 2
    scraper = Scraper.define do
      process "div#content", :specifics => :element
      #process "html>body>div:nth-of-type(3)>div:nth-of-type(2)>div:nth-of-type(2)>div:nth-of-type(" + day_number.to_s + ")>div>div>div:nth-of-type(" + row_number.to_s + ")>div>span:nth-of-type(1)", :specifics => :element
      #process 'div+h2', :specifics => :text
      result :specifics
    end
    uri = URI.parse("http://www.eardrumnyc.com/")
    #puts 'html>body>div:nth-of-type(3)>div:nth-of-type(2)>div:nth-of-type(2)>div:nth-of-type(' + day_number.to_s + ')>div>div>div:nth-of-type(' + row_number.to_s + ')>div>span:nth-of-type(1)'
    raw_specifics = scraper.scrape(uri)
    raw_spec_arr = raw_specifics.to_s.split('<span class=\'show-specifics\'>')[1..-1]
    raw_spec_arr.each do |spec_row|
      rv << spec_row.split('</span>').first
    end
    return rv
  end
  
  def self.scrape_shows

    
    rss_uri = 'http://www.eardrumnyc.com/feed/upcoming-shows/'
    rss_feed = RSS::Parser.parse(open(rss_uri).read, false)
    
    rv = []
    
    rss_feed.items.each do |row|
      row = row.description
      artists = row.split(' at ').first.strip
      venue = row.split(' at ').last.split(' on ').first.strip
      date_string = row.split(', ').last.strip
      date = Chronic.parse(date_string)
      raw_specifics = 
      rv << {:artists => artists, :venue => venue, :date => date}
    end
    return rv

  end
end
