class Image::Portfolio < Image::Base
  include Mongoid::Document

  embedded_in :photographer
end