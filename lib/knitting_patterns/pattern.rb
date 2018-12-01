class KnittingPatterns::Pattern
  attr_accessor :title, :url, :category

  def self.knit_categories
    self.scrape_knit_categories
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





end
