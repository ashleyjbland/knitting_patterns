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
    doc = Nokogiri::HTML(open(https://www.ravelry.com/patterns/search#view=captioned_thumbs&craft=knitting&sort=recently-popular))
  end
end
