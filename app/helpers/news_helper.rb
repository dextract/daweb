module NewsHelper
  def articles
    list_of_articles = News.first(5)
  end
end
