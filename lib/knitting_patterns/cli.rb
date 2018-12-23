#CLI controller, responsible for user interaction
class KnittingPatterns::CLI

  def call
    puts "___________________________________________________________________________________________"
    puts "Hello fellow knitter!"
    puts "___________________________________________________________________________________________"
    list_categories
    menu
  end

  def list_categories
    puts "Here are the categories of the free knitting patterns from Purl Soho:"
    @categories = KnittingPatterns::Scraper.new.scrape_knit_categories
    @categories.each.with_index(1) {|category, index| puts "#{index}. #{category}"}
    puts "___________________________________________________________________________________________"
  end

  def list_category_patterns
    puts "___________________________________________________________________________________________"
    puts ""
    KnittingPatterns::Scraper.new.scrape_category_patterns(@input)
    KnittingPatterns::Pattern.all.each_with_index do |pattern, index|
      puts "#{index+1}. #{pattern.title}"
    end
    puts "___________________________________________________________________________________________"
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "To see all the patterns in a category, enter the corresponding number."
      puts "Type 'list' to see them all again or 'exit' to leave."
      puts "___________________________________________________________________________________________"
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

  def choosing_a_pattern
    puts ""
    puts "For more information on a specific pattern, please enter the corresponding number."
    puts "Or if none of these patterns are jumping out at you, type 'list' to see the categories again."
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        pattern = KnittingPatterns::Pattern.all[input.to_i-1]
        puts "___________________________________________________________________________________________"
        puts "#{pattern.title}"
        puts "___________________________________________________________________________________________"
        KnittingPatterns::Scraper.new.scrape_selected_pattern("#{pattern.url}")
        puts "___________________________________________________________________________________________"
        puts "To visit the website directly click here ----> #{pattern.url}"
        puts ""
        goodbye
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
    puts "___________________________________________________________________________________________"
    exit
  end
end
