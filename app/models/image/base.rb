class Image::Base
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment
  #before_create :set_unique_file_name

  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)

  protected
  def set_unique_file_name
    self.attachment.instance_write :file_name, "#{SecureRandom.uuid}"
  end
end
