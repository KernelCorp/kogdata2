json.extract! @conversation, :id, :theme, :messages
json.messages @conversation.messages do |message|
  json.partial! 'messages/message', message: message
end
