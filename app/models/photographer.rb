class Photographer < User
  has_and_belongs_to_many :skills, foreign_key: :user_id
  has_many :event_requests, foreign_key: :photographer_id, dependent: :destroy
end