class KnittingPatterns::Pattern #class that makes the model
  attr_accessor :title, :url, :category
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
