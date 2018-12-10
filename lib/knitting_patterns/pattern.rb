class KnittingPatterns::Pattern #class that makes the model
  attr_accessor :title, :url, :category
  @@all = []

  def initialize
    @title = title
    @url = url
    @@all << self
  end

  def self.knit_categories
    KnittingPatterns::Scraper.scrape_knit_categories
  end

  def self.category_patterns(user_input)
    KnittingPatterns::Scraper.scrape_category_patterns(user_input)
  end

  end
