class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation,
                  :name, :surname, :vk, :facebook, :google, :city, :avatar,
                  :remember_me, :type

  has_attached_file :avatar

  has_and_belongs_to_many :conversations do
    def create!(attributes = nil, options = {}, &block)
      conv = build attributes, options, &block
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
  before_create :set_unique_avatar_name

  protected
  def set_unique_avatar_name
    self.avatar.instance_write :file_name, "#{SecureRandom.uuid}"
  end
end
