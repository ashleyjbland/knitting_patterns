class KnittingPatterns::Scraper #back end or controller class

  def scrape_knit_categories
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    category = doc.css("li.categories").css("ul").css("li").text.split("\n")
    category
  end

  def scrape_category_patterns(user_input)
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-#{user_input}/"))
    doc.css("li").css("h3").css("a").each do |pattern_info|
      pattern = KnittingPatterns::Pattern.new

      pattern.title = pattern_info.text
      pattern.url = pattern_info.attribute("href").value

      pattern.save
    end
  end

  def self.test #this is returning the data i want scrape_category_patterns to return
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-garments/"))
    doc.css("li").css("h3").css("a").each.with_index(1) do |title, index|
      puts "#{index}. #{title.text}"
      puts "#{title.attribute("href")}"
    end
  end




  #def self.scrape_pattern_url(something) #this still needs a lot of work
  #  KnittingPatterns::Pattern.url = #doc.css("li").css("h3").css("a").attribute["href"].value
    #pattern.url = @pattern_info.attributes["href"].value

  #end
end


#pattern.url = #url = pattern_name.attributes["href"].value Nokogiri::HTML(open("#{pattern.url}"))

#@urls = doc.css("li").css("h3").css("a").attr("href") #definitely in the wrong spot, wrong method, wrong class
#@urls.each {|url| puts "#{url}"}
