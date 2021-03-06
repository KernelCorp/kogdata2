class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Slug

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login_or_email]

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  validates_acceptance_of :terms

  ## Custom fields
  attr_accessor :login_or_email
  
  field :login, type: String, default: ->{ _id }
  slug :login

  field :name,    type: String
  field :surname, type: String

  field :vk_id

  field :location
  field :site
  field :vk
  field :fb
  field :tw
  field :gp

  has_mongoid_attached_file :avatar,
                            default_url: '/images/bender.jpg',
                            styles: {
                                small: ["300x300#", :jpg],
                                thumb: ["50x50#", :jpg]
                            }

  embeds_one :subscribe
  accepts_nested_attributes_for :subscribe, update_only: true
  after_create :create_subscribe

  has_and_belongs_to_many :conversations
  before_create :set_unique_avatar_name

  validates :login, uniqueness: { case_sensitive: false }

  validates_attachment_content_type :avatar, content_type: %w(image/jpg image/jpeg image/png)

  protected
  def set_unique_avatar_name
    self.avatar.instance_write :file_name, "#{SecureRandom.uuid}" if self.avatar.exists?
  end

  def self.find_for_database_authentication( warden_conditions )
    conditions = warden_conditions.dup
    if login_or_email = conditions.delete(:login_or_email)
      where(conditions).where(
        '$or' => [ 
          { login: /^#{Regexp.escape(login_or_email)}$/i }, 
          { email: /^#{Regexp.escape(login_or_email)}$/i } 
        ]
      ).first
    else
      where(conditions).first
    end
  end 
end
