class KnittingPatterns::Category
  attr_accessor :title
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
