class Message
  include Mongoid::Document
  field :text
  belongs_to  :user
  embedded_in :conversation
end
