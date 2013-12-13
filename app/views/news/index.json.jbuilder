json.array!(@news) do |news|
  json.extract! news, :id, :photo, :title, :timestamp
  json.url news_url(news, format: :json)
end
