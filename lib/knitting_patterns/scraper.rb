class KnittingPatterns::Scraper #back end or controller class

  def self.scrape_patterns #should be a class method in pattern.rb, do I need to include this at all??
    scrape_category_patterns
  end

  def self.scrape_category_patterns(user_input)
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-#{user_input}/"))
    #binding.pry
    pattern_name = doc.css("li").css("h3").css("a").each do |pattern_name|
      pattern = KnittingPatterns::Pattern.new
      pattern.title = pattern_name.text
      puts pattern.title
      #category_patterns = [] << pattern.title
      #category_patterns.each.with_index(1) do |pattern, index|
      #  puts "#{index}. #{pattern}"
      #end
    end
  end

  def self.scrape_knit_categories
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    category = doc.css("li.categories").css("ul").css("li").text.split("\n")
    #pattern.title = doc.css("li").css("h3").each.with_index(1) {|title, index| puts "#{index}. #{title.text}"}
    #pattern.title = doc.css("li").css("h3").each {|title| puts title.text}
    #pattern.url = doc.css("li").css("h3").css("a").attr("href").each {|url| puts url}
#binding.pry
    category
  end

  #def self.scrape_category_patterns
  #  doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-blankets/"))
  #  title = doc.css("li").css("h3").css("a").text
  #  url = doc.css("li").css("h3").css("a").attr("href").strip
  #  binding.pry
  #end
end

#pattern.url = #url = pattern_name.attributes["href"].value Nokogiri::HTML(open("#{pattern.url}"))

#@urls = doc.css("li").css("h3").css("a").attr("href") #definitely in the wrong spot, wrong method, wrong class
#@urls.each {|url| puts "#{url}"}
