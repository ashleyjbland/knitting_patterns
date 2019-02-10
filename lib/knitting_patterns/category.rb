class KnittingPatterns::Category
  attr_accessor :title
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.patterns
    patterns = KnittingPatterns::Pattern.all.select {|pattern| pattern.category == self}
  end

  def self.pattern_count
    patterns = KnittingPatterns::Pattern.all.each {|pattern| pattern.category == self}
    patterns.count
  end
end
