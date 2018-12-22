class KnittingPatterns::Pattern #class that makes the model
  attr_accessor :title, :url, :category
  @@all = []

  def initialize
    @title = title
    @url = url
  end

  def self.all
    @@all
  end

  def open_in_browser
    system("open '#{url}'")
  end

  def save
    @@all << self
  end

  #def self.new_from_category_type(user_input) #as of 12/17 i think the following methods are extra
  #  pattern_info = KnittingPatterns::Scraper.scrape_category_patterns(user_input).css("li").css("h3").css("a")
  #    self.new(pattern_info.text, pattern_info.attribute("href").value)
  #end

  #def self.knit_categories
  #  KnittingPatterns::Scraper.scrape_knit_categories
  #end

  #def self.category_patterns(user_input)
#
  #  @@all.each.with_index(1) do |pattern_info, index|
  #    #pattern.title = pattern_info.text
  #    #pattern.url = pattern_info.attribute["href"].value
  #    puts "#{index}. #{pattern.title}"
  #  end
  #end

end
