class KnittingPatterns::Category
  attr_accessor :title, :patterns
  @@all = []

  def initialize
    @patterns = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  #def patterns
  #  KnittingPatterns::Pattern.all.keep_if {|pattern| pattern.category == self}
  #end

  def self.pattern_count
    patterns = KnittingPatterns::Pattern.all.each {|pattern| pattern.category == self}
    patterns.count
  end
end
