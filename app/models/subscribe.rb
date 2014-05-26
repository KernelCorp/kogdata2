class Subscribe
  include Mongoid::Document

  field :responses, type: Boolean
  field :messages, type: Boolean
  field :events_in_town, type: Boolean

  embedded_in :user
end
