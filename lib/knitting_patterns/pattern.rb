class KnittingPatterns::Pattern
  attr_accessor :title, :url, :category, :details
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
    binding.pry
  end

  def pattern_category
    pattern.category if category
  end
end
