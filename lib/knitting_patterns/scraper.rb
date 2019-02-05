class KnittingPatterns::Scraper

  def scrape_knit_categories
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    doc.css("li.categories").css("ul").css("li").each do |title|
      category = KnittingPatterns::Category.new

      category.title = title.text

      category.save
    end
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

  def scrape_selected_pattern(pattern)
    doc = Nokogiri::HTML(open("#{pattern.url}"))
    doc.css("div.pf-content").css("p").each do |info|
      pattern.details = info.text.strip

      pattern.save
      puts pattern.details
    end
  end
end
