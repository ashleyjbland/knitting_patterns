class KnittingPatterns::Pattern 
  attr_accessor :title, :url, :category
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
