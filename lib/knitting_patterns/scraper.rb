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

  def scrape_selected_pattern(pattern_url)
    doc = Nokogiri::HTML(open("#{pattern_url}"))
    doc.css("div.pf-content").css("p").each do |info|
      puts "#{info.text.strip}"
    end
  end

  def self.test
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/2018/10/12/muhuroosa-blanket/"))
    doc.css("div.pf-content").css("p").each do |info|
      puts "#{info.text}"
    end
  end
end
