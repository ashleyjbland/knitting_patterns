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
end
