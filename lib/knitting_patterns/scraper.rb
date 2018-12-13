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
    Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-#{user_input}/"))
  end

  #def self.scrape_pattern_url(something) #this still needs a lot of work
  #  KnittingPatterns::Pattern.url = #doc.css("li").css("h3").css("a").attribute["href"].value
    #pattern.url = @pattern_info.attributes["href"].value

  #end
end

#class WorldsBestRestaurants::Scraper
#
#  def get_page
#    Nokogiri::HTML(open("https://www.theworlds50best.com/list/1-50-winners"))
#  end
#
#  def scrape_restaurants_index
#     self.get_page.css("div#t1-50 li")
#  end
#
#  def make_restaurants
#    scrape_restaurants_index.each do |r|
#      WorldsBestRestaurants::Restaurant.new_from_index_page(r)
#    end
#  end
#end

#pattern.url = #url = pattern_name.attributes["href"].value Nokogiri::HTML(open("#{pattern.url}"))

#@urls = doc.css("li").css("h3").css("a").attr("href") #definitely in the wrong spot, wrong method, wrong class
#@urls.each {|url| puts "#{url}"}
