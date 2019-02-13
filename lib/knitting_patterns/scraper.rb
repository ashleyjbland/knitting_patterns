class KnittingPatterns::Scraper

  def scrape_knit_categories
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-view-all/"))
    doc.css("li.categories").css("ul").css("li").each do |title|
      category = KnittingPatterns::Category.new

      category.title = title.text

      category.save
    end
  end

  def scrape_category_patterns(category)
    doc = Nokogiri::HTML(open("https://www.purlsoho.com/create/category/knit/knit-#{category.title.strip.downcase.split(" + ").join("-")}/"))

    doc.css("li").css("h3").css("a").each do |pattern_info|
      pattern = KnittingPatterns::Pattern.new

      pattern.title = pattern_info.text
      pattern.url = pattern_info.attribute("href").value
      pattern.category = category

      category.patterns << pattern

      pattern.save
    end
  end

  def scrape_selected_pattern(pattern)
    doc = Nokogiri::HTML(open("#{pattern.url}"))
    pattern.details = doc.css("div.pf-content").css("p").text.strip

    pattern.save

    puts pattern.details
  end
end
