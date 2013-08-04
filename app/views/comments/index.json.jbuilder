json.array!(@comments) do |comment|
  json.extract! comment, :article_id, :nick, :email, :content, :ifnotify
  json.url comment_url(comment, format: :json)
end
