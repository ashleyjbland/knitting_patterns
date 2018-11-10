#CLI controller, responsible for user interaction
class KnittingPatterns::CLI

  def call
    list_patterns
    menu
  end

  def list_patterns
    puts "Hello fellow knitter, here are the 'hot right now' Ravelry patterns:"
    puts <<-DOC
    1. Owlen Cardigan by Cheryl Toy
    2. Frost Branches by Sweet Birch Designs
    3. Sirius by Camilla Vad
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the pattern you'd like more details on or 'list' to see them all again or 'exit' to leave."
      input = gets.strip.downcase
      case input
      when "1"
        puts "Here are the details for first pattern:"
      when "2"
        puts "Here are the details for second pattern:"
      when "3"
        puts "Here are the details for third pattern:"
      when "list"
        list_patterns
      when "exit"
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
