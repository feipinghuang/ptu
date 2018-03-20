module Detectable
  extend ActiveSupport::Concern

  included do
    has_one_attached :image
  end

  def image_file
    Tempfile.new([image.filename.base, image.filename.extension_with_delimiter]).tap do |file|
      file.binmode
      file.write(image.download)
      file.close
    end
  end
end
