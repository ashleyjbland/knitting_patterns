class KnittingPatterns::Scraper #back end or controller class

  def scrape_patterns #should be a class method in pattern.rb, do I need to include this at all??
    scrape_category_patterns
  end

  def scrape_category_patterns #should be a class method in pattern.rb
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-#{@input}/"))
    binding.pry
    doc.css("li").css("h3").css("a").each do |pattern_name|
      pattern = Pattern.new
      #pattern.title = pattern_name.text
      #pattern.url = #url = pattern_name.attributes["href"].value Nokogiri::HTML(open("#{pattern.url}"))

    #@urls = doc.css("li").css("h3").css("a").attr("href") #definitely in the wrong spot, wrong method, wrong class
    #@urls.each {|url| puts "#{url}"}
  end
  end

  def self.scrape_knit_categories #scraping methods need to have their own class, back end/controller class
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    category = doc.css("li.categories").css("ul").css("li").text.split("\n")
    #pattern.title = doc.css("li").css("h3").each.with_index(1) {|title, index| puts "#{index}. #{title.text}"}
    #pattern.title = doc.css("li").css("h3").each {|title| puts title.text}
    #pattern.url = doc.css("li").css("h3").css("a").attr("href").each {|url| puts url}
#binding.pry
    category
  end

  def self.scrape_category_patterns
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-blankets/"))
    title = doc.css("li").css("h3").css("a").text
    url = doc.css("li").css("h3").css("a").attr("href").strip
    binding.pry
  end
end
