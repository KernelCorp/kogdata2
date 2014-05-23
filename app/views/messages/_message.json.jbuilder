json.extract! message, :id, :text

unless message.user.nil?
  json.user do
    json.extract! message.user, :id, :name
    json.url user_url message.user
  end
end
