class Photographer < User
  SKILLS = %w( wedding love children family studio corporate report advertising )

  field :skills, type: Array
  field :price

  has_many :event_requests, foreign_key: :photographer_id, dependent: :destroy
  embeds_many :image_portfolios, class_name: 'Image::Portfolio'
end
