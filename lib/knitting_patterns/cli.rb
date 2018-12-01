#CLI controller, responsible for user interaction
class KnittingPatterns::CLI

  def call
    puts "Hello fellow knitter!"
    list_categories
    menu
  end

  def list_categories
    puts "Here are the categories of the free knitting patterns from Purl Soho:"
    @categories = KnittingPatterns::Pattern.knit_categories
    @categories.each.with_index(1) {|category, index| puts "#{index}. #{category}"}
  end

  def menu
    input = nil
    while input != "exit"
      puts "To see all the patterns in a category, enter the number of the category."
      puts "Type 'list' to see them all again or 'exit' to leave."
      input = gets.strip.downcase

      if input.to_i > 0
        puts "#{@categories[input.to_i-1]}"
      elsif input == "list"
        puts "Interested in some more ideas, huh?"
        list_categories
      elsif input == "exit"
        goodbye
      else
        print "Hmm, I'm not familiar with that pattern. "
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Come back anytime to review more knitting patterns!"
  end

end
