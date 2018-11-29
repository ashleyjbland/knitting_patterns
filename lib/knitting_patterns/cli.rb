#CLI controller, responsible for user interaction
class KnittingPatterns::CLI

  def call
    list_patterns
    menu
  end

  def list_patterns
    puts "Hello fellow knitter, here are the free knitting patterns from Purl Soho"
    @patterns = KnittingPatterns::Pattern.knit_patterns
    @patterns.each.with_index(1) do |pattern, index|
      puts "#{index}. #{pattern.title}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the pattern you'd like more details on or 'list' to see them all again or 'exit' to leave."
      input = gets.strip.downcase

      if input.to_i > 0
        the_pattern = @patterns[input.to_i-1]
        puts "#{the_pattern.title} by #{the_pattern.author}"
      elsif input == "list"
        list_patterns
      elsif input == "exit"
        goodbye
      else
        print "Hmm, I'm not familiar with that pattern. "
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Come back anytime to review more knit sh!t!"
  end

end
