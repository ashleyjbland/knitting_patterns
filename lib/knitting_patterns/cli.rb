#CLI controller, responsible for user interaction
class KnittingPatterns::CLI

  def call
    puts "Hello fellow knitter!"
    list_categories
    menu
  end

  def list_categories
    puts "Here are the categories of the free knitting patterns from Purl Soho:"
    @categories = KnittingPatterns::Scraper.new.scrape_knit_categories
    @categories.each.with_index(1) {|category, index| puts "#{index}. #{category}"}
  end

  def list_category_patterns
    puts "Here are the patterns in the #{@input} category:"
    KnittingPatterns::Scraper.new.scrape_category_patterns(@input)
    KnittingPatterns::Pattern.all.each_with_index do |pattern, index|
      puts "#{index+1}. #{pattern.title}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "To see all the patterns in a category, enter the number of the category."
      puts "Type 'list' to see them all again or 'exit' to leave."
      input = gets.strip.downcase

      if input.to_i > 0
        @input = @categories[input.to_i-1]
        list_category_patterns
        choosing_a_pattern
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

  def choosing_a_pattern #this needs work
    puts "If you would like more information on a specific pattern please enter the number of the pattern and you will be redirected to the web page."
    puts "Or if none of these patterns are jumping out at you, type 'list' to see the categories again."
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        #KnittingPatterns::Scraper.test
        pattern = KnittingPatterns::Pattern.all[input.to_i-1]
        KnittingPatterns::Scraper.new.scrape_selected_pattern_info("#{pattern.url}")
      elsif input == "list"
        call
      elsif input == "exit"
        goodbye
      else
        puts "Hmm, I don't see that pattern. Here is the list of categories again:"
        call
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Come back anytime to review more knitting patterns!"
    exit
  end
end
