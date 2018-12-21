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
    patterns = KnittingPatterns::Scraper.scrape_category_patterns(@input)
    patterns.each.with_index do |title, index|
      puts "#{index}. #{title}"
    end
    #patterns.each.with_index(1) {|pattern, index| puts "#{index}. #{pattern}"}
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

  def choosing_a_pattern #this might be an ugly method
    puts "If you would like more information on a specific pattern please enter the number of the pattern and you will be redirected to the web page."
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        #KnittingPatterns::Scraper.scrape_pattern_url(input)
      elsif input == "exit"
        goodbye
      else
        puts "Hmm, I don't see that pattern. Here is the list of categories again:"
        list_categories
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Come back anytime to review more knitting patterns!"
  end

end
