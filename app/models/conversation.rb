class Conversation
  include Mongoid::Document
  field :theme, type: String

  has_and_belongs_to_many :users
  embeds_many :messages
end
