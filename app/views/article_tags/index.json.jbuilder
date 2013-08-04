json.array!(@article_tags) do |article_tag|
  json.extract! article_tag, :article_id, :tag
  json.url article_tag_url(article_tag, format: :json)
end
