json.extract! message, :id, :text
json.user do
  unless message.user.nil?
    json.name = message.user.name
    json.id   = message.user.id.to_s
    json.url  = user_url message.user
  end
end