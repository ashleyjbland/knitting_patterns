class KnittingPatterns::Category
  attr_accessor :title
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def patterns
    KnittingPatterns::Pattern.all.select {|pattern| KnittingPatterns.Pattern.category == self}
  end

  def self.pattern_count
    KnittingPatterns::Pattern.all.count
  end
end
