class KnittingPatterns::Pattern
  attr_accessor :title, :url, :category, :details
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def category
    KnittingPatterns::Category.title
  end
end
