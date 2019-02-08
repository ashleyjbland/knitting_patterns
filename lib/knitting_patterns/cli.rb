class KnittingPatterns::CLI

  def call
    puts "Hey fellow knitter!"
    puts "Here are the categories of the free knitting patterns from Purl Soho:"
    spacer
    list_categories
    menu
  end

  def list_categories
    puts ""
    if KnittingPatterns::Category.all == []
      KnittingPatterns::Scraper.new.scrape_knit_categories
    end
    KnittingPatterns::Category.all.each.with_index(1) {|category, index| puts "#{index}. #{category.title}"}
    spacer
  end

  def list_category_patterns
    spacer
    puts ""
    if KnittingPatterns::Pattern.all == []
      KnittingPatterns::Scraper.new.scrape_category_patterns(@input)
    end
    KnittingPatterns::Pattern.all.uniq.each_with_index do |pattern, index| #this is not returning the correct patterns
      puts "#{index+1}. #{pattern.title}"
    end
    spacer
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "To see all the patterns in a category, enter the corresponding number."
      puts "Type 'list' to see them all again or 'exit' at anytime to leave."
      spacer
      input = gets.strip.downcase

      if input.to_i == 7
        @input = "toys-hobbies"
        list_category_patterns
        choosing_a_pattern
      elsif input.to_i > 0 && input.to_i <= KnittingPatterns::Category.all.size
        @input = KnittingPatterns::Category.all[input.to_i-1].title.strip.downcase
        list_category_patterns
        choosing_a_pattern
      elsif input == "list"
        puts "Interested in some more ideas, huh?"
        list_categories
      elsif input == "exit"
        goodbye
      else
        print "Hmm, I'm not seeing that category. "
      end
    end
  end

  def choosing_a_pattern
    puts ""
    puts "For more information on a specific pattern, please enter the corresponding number."
    puts "Or if none of these patterns are jumping out at you, type 'list' to see the categories again."
    spacer
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= KnittingPatterns::Category.pattern_count.size
        pattern = KnittingPatterns::Pattern.all[input.to_i-1]
        spacer
        puts "#{pattern.title}"
        spacer
        KnittingPatterns::Scraper.new.scrape_selected_pattern(pattern)
        spacer
        puts "To visit the website directly click here ----> #{pattern.url}"
        puts ""
        puts "If you would like to see another pattern in this category, simply enter the corresponding number."
        puts "If you would like to see the list of categories instead, type 'list'"
        spacer
      elsif input == "list"
        call
      elsif input == "exit"
        goodbye
      else
        puts "Hmm, I don't see that pattern. Let's try this again."
        call
      end
    end
  end

  def spacer
    puts "___________________________________________________________________________________________"
  end

  def goodbye
    puts "Thanks for stopping by! Come back anytime to review more knitting patterns!"
    spacer
    exit
  end
end
