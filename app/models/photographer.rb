class Photographer < User
  field :skills, type: Array
  has_many :event_requests, foreign_key: :photographer_id, dependent: :destroy
  embeds_many :image_portfolios, class_name: 'Image::Portfolio'
end