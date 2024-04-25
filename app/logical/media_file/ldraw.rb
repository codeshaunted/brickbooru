# frozen_string_literal: true

class MediaFile::Ldraw < MediaFile
  def dimensions
    [1, 1] # placeholder, if we just let it be [0, 0] it errors
  end

  def preview!(max_width, max_height, **options)
    w, h = MediaFile.scale_dimensions(width, height, max_width, max_height)
    File.open("test/files/apng/not_apng.png", "rb") do |file| # TODO: add preview renderer, for now dirty hack for placeholder image
      # Read the contents of the file and return
      MediaFile::Image.new(file).resize!(w, h, **options)
    end
  end
end
