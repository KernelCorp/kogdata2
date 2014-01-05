class Photographer < User
  has_and_belongs_to_many :skills, foreign_key: :user_id
end