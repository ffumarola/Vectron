require 'rss'
require 'chronic'

class RssReader
  include RSS
  
  def self.read_eardrumnyc
    uri = 'http://www.eardrumnyc.com/feed/upcoming-shows/'
    rss = Parser.parse(open(uri).read, false)
    rv = []
    rss.items.each do |row|
      row = row.description
      artists = row.split(' at ').first.strip
      venue = row.split(' at ').last.split(' on ').first.strip
      date_string = row.split(', ').last.strip
      date = Chronic.parse(date_string)
      rv << {:artists => artists, :venue => venue, :date => date}
    end
    return rv
  end
  
  def self.test
    rv = Hash.new
    rv[:dog] = 'stupid'
    rv[:cat] = 'intolerant'
    return rv
  end
end
