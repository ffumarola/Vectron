require 'rss'
require 'chronic'

class ScrapeOffoffonline
  def self.scrape_uri(row)
    scraper = Scraper.define do
      process "html>body>table:nth-of-type(2) tr>td:nth-of-type(2)>table tr:nth-of-type(" + row.to_s + ")>td:nth-of-type(2)>b>a:nth-of-type(1)", :uri => "@href"
      result :uri
    end
    
    uri = URI.parse("http://www.offoffonline.com/listings.php?mode=Comedy")
    scraper.scrape(uri)
  end
  
  def self.scrape_shows
    rv = []

    overview_scraper = Scraper.define do
      process 'html>body>table:nth-of-type(2) tr>td:nth-of-type(2)>table tr>td>table tr:nth-of-type(2)>td:nth-of-type(1)', :overview => :text
      result :overview
    end
    
    description_scraper = Scraper.define do
      process 'html>body>table:nth-of-type(2) tr>td:nth-of-type(2)>table tr>td>table tr:nth-of-type(2)>td:nth-of-type(2)', :description => :text
      result :description
    end
    
    details_scraper = Scraper.define do
      process 'html>body>table:nth-of-type(2) tr>td:nth-of-type(2)>table tr>td>table tr:nth-of-type(4)>td', :details => :text
      result :details
    end
    
    show_url_scraper = Scraper.define do
      process 'html>body>table:nth-of-type(2) tr>td:nth-of-type(2)>table tr>td>table tr:nth-of-type(2)>td:nth-of-type(1)>a', :uri => "@href"
      result :uri
    end
    
    ticket_url_scraper = Scraper.define do
      process 'html>body>table:nth-of-type(2) tr>td:nth-of-type(2)>table tr>td>table tr:nth-of-type(4)>td>a:nth-of-type(2)', :uri => "@href"
      result :uri
    end
    
    #first three rows are header info
    i = 4
    uri = scrape_uri(i)
    
    while uri
      external_id = uri.split("id=").last
      uri = URI.parse("http://www.offoffonline.com/" + uri)
      
      raw_overview = overview_scraper.scrape(uri)
      overview_hash = parse_overview(raw_overview)
      
      raw_description = description_scraper.scrape(uri)
      description_hash = parse_description(raw_description)
      
      raw_details = details_scraper.scrape(uri)
      details_hash = parse_details(raw_details)
      
      misc_hash = {:show_url => show_url_scraper.scrape(uri), :ticket_url => ticket_url_scraper.scrape(uri), :external_id => external_id}
      
      rv << overview_hash.merge(description_hash).merge(details_hash).merge(misc_hash)
      
      i += 1
      uri = scrape_uri(i)
    end
    
    return rv
  end
  
  def self.parse_overview(raw_overview)
    rv = Hash.new
    overvw_arr = raw_overview.split("\n")
    
    rv[:category] = overvw_arr[0].gsub("Category: ", "").strip
    rv[:author] = overvw_arr[1].gsub("By: ", "").strip
    rv[:director] = overvw_arr[2].gsub("Directed by ", "").strip
    rv[:producer] = overvw_arr[3].gsub("Produced by ", "").strip
    #4th, 6th entry blank
    rv[:runtime] = overvw_arr[5].gsub("Running Time: ", "").strip
    
    return rv
  end
  
  def self.parse_description(raw_description)
    rv = Hash.new
    desc_arr = raw_description.split("CAST and CREW: ")
    rv[:synopsis] = desc_arr[0].gsub("SYNOPSIS: ", "").gsub("\n", " ").strip
    rv[:cast_crew] = desc_arr[1].split("\n\n")[0].gsub("\n", " ").strip
    
    return rv
  end
  
  def self.parse_details(raw_details)
    rv = Hash.new
    details_arr = raw_details.split("\n")
    
    rv[:venue] = details_arr[0].gsub("Theater: ", "").strip
    rv[:open_date] = Chronic.parse(details_arr[1].gsub("Opens ", "").strip)
    rv[:close_date] = Chronic.parse(details_arr[2].gsub("Closes ", "").strip)
    #4th entry blank
    rv[:schedule] = details_arr[4].gsub("Schedule: ", "").strip
    rv[:ticket_price] = details_arr[5].gsub("Tickets: ", "").strip
    rv[:discount_price] = details_arr[6].gsub("Discounts: ", "").strip
    rv[:phone] = details_arr[7].gsub("Phone:&nbsp; ", "").strip
    return rv
  end
end


