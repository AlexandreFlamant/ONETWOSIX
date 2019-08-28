require 'open-uri'
require 'nokogiri'

class ScraperDeliveroo
  def initialize(postcode, foodtype)
    @postcode = postcode
    @foodtype = foodtype
  end

  def call
    url = "https://deliveroo.co.uk/restaurants/london/haggerston?postcode=#{@postcode}&collection=#{@foodtype}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    # puts html_doc

    html_doc.search('.HomeFeedUICard-45fe00a3d559fba5').each do |element|
      puts "--Next--"
      puts "restaurant name:" + element.search(".HomeFeedUICard-f7ccdc5e7b2c5059.HomeFeedUICard-a9d288756e60cf37").text.strip
      puts "delivery time:" + element.search('.HomeFeedUICard-3eaa3aeebdb9dda4 p').text.strip
    end
  end
end

scraper = ScraperDeliveroo.new("E28DY", "pizza")
scraper.call
