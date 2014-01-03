class Conversation < ActiveRecord::Base
  attr_accessible :theme, :owner
  has_and_belongs_to_many :users, join_table: :conversations_users
  belongs_to :owner, class_name: 'User'
end
