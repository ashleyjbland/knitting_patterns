class KnittingPatterns::Scraper #back end or controller class

  def self.scrape_patterns #i don't think i need this
    scrape_category_patterns
  end

  def self.scrape_knit_categories
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    category = doc.css("li.categories").css("ul").css("li").text.split("\n")
    category
  end

  def self.scrape_category_patterns(user_input)
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-#{user_input}/"))
    pattern_name = doc.css("li").css("h3").css("a").each.with_index(1) do |pattern_name, index|
      pattern = KnittingPatterns::Pattern.new
      pattern.title = pattern_name.text
      puts "#{index}. #{pattern.title}"
    end
  end

  def self.scrape_pattern_url
    #pattern.url = @pattern_info.attributes["href"].value
    #Nokogiri::HTML(open("#{pattern.url}"))
  end
end



#pattern.url = #url = pattern_name.attributes["href"].value Nokogiri::HTML(open("#{pattern.url}"))

#@urls = doc.css("li").css("h3").css("a").attr("href") #definitely in the wrong spot, wrong method, wrong class
#@urls.each {|url| puts "#{url}"}
