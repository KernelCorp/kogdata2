class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :name, :surname, :vk, :facebook, :google, :city
  has_and_belongs_to_many :conversations do
    def create!(attributes = nil, options = {}, &block)
      conv = super attributes, options, &block
      conv.owner = proxy_association.owner
      conv.save!
      conv
    end
    def build(attributes = nil, options = {}, &block)
      conv = super attributes, options, &block
      conv.owner = proxy_association.owner
      conv
    end
  end
  accepts_nested_attributes_for :conversations
end
