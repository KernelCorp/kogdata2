json.array!(@conversations) do |conversation|
  json.extract! conversation, :theme
  json.set! :id, conversation.id.to_s
end
