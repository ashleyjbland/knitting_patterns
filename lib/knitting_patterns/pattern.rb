class KnittingPatterns::Pattern
  attr_accessor :title, :author

  def self.hot_right_now
    #goal is to turn a list of patterns
    #puts <<-DOC
    #1. Owlen Cardigan by Cheryl Toy
    #2. Frost Branches by Sweet Birch Designs
    #3. Sirius by Camilla Vad
    #DOC

    pattern_1 = self.new
    pattern_1.title = "Owlen Cardigan"
    pattern_1.author = "Cheryl Toy"

    pattern_2 = self.new
    pattern_2.title = "Frost Branches"
    pattern_2.author = "Sweet Birch Designs"

    [pattern_1, pattern_2]
  end
end
