json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :theme
  json.url conversation_url(conversation, format: :json)
end
