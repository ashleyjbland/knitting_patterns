#CLI controller, responsible for user interaction
class KnittingPatterns::CLI

  def call
    list_patterns
    menu
  end

  def list_patterns
    puts "Hello fellow knitter!"
    puts "Here are the free knitting patterns from Purl Soho:"
    @patterns = KnittingPatterns::Pattern.knit_patterns
    #@urls = KnittingPatterns::Pattern.selected_pattern
    #@url.each.with_index(1) do |url, index|
      #puts "#{index}. #{url}"
    #end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the pattern you'd like more details on or 'list' to see them all again or 'exit' to leave."
      input = gets.strip.downcase

      if input.to_i > 0
        #the_url = @urls[input.to_i-1]
        #puts "#{the_url}"
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
    puts "Thanks for stopping by! Come back anytime to review more knitting patterns!"
  end

end
