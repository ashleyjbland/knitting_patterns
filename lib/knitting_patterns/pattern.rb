class KnittingPatterns::Pattern
  attr_accessor :title, :author

  def self.knit_patterns
    #scrape ravelry
    self.scrape_patterns
  end

  def self.scrape_patterns
    patterns = []


    patterns
  end

  def self.scrape_purlsoho
    #doc = Nokogiri::HTML(open("https://www.ravelry.com/patterns/search#view=captioned_thumbs&sort=recently-popular&craft=knitting"))
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    pattern = self.new
    pattern.title = doc.css("li").css("h3").text

    binding.pry
  end
end
