class KnittingPatterns::Pattern #class that makes the model
  attr_accessor :title, :url, :category

  def self.knit_categories
    KnittingPatterns::Scraper.scrape_knit_categories
  end


end
