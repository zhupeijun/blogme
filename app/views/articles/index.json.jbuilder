json.array!(@articles) do |article|
  json.extract! article, :title, :content, :date, :author, :tags
  json.url article_url(article, format: :json)
end
