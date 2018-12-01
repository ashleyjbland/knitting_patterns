class KnittingPatterns::Pattern
  attr_accessor :title, :url, :category

  def self.knit_patterns
    #scrape ravelry
    self.scrape_patterns
  end

  def self.scrape_patterns
    patterns = []

    patterns << self.scrape_knit_categories

    patterns
  end

  def self.scrape_knit_categories
    #doc = Nokogiri::HTML(open("https://www.ravelry.com/patterns/search#view=captioned_thumbs&sort=recently-popular&craft=knitting"))
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    pattern = self.new
    pattern.category = doc.css("li.categories").css("ul").css("li").each.with_index(1) {|category, index| puts "#{index}. #{category.text}"}
    #pattern.title = doc.css("li").css("h3").each.with_index(1) {|title, index| puts "#{index}. #{title.text}"}
    #pattern.title = doc.css("li").css("h3").each {|title| puts title.text}
    #pattern.url = doc.css("li").css("h3").css("a").attr("href").each {|url| puts url}
#binding.pry
    pattern
  end



end
