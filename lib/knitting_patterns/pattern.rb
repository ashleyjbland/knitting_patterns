class KnittingPatterns::Pattern
  attr_accessor :title, :author

  def self.hot_right_now
    #scrape ravelry
    self.scrape_patterns
  end

  def self.scrape_patterns
    patterns = []


    patterns
  end

  def self.scrape_ravelry
    doc = Nokogiri::HTML(open("https://www.ravelry.com/patterns/search#view=captioned_thumbs&sort=recently-popular&craft=knitting"))

    pattern = self.new
    #pattern.title = doc.search("")
    #deal.price = doc.search("#todays-deal span.price").text.strip
    pattern.author = doc.search("#page")
    binding.pry
  end
end
