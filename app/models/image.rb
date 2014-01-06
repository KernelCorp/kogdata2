class Image < ActiveRecord::Base

  attr_accessible :attachment
  belongs_to :photographer, class_name: 'Photographer'

  has_attached_file :attachment
  before_create :set_unique_file_name

  protected
  def set_unique_file_name
    self.attachment.instance_write :file_name, "#{SecureRandom.uuid}"
  end
end
