class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  process :resize_to_fit => [200, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [40, 40]
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/" + [version_name,"default.png"].compact.join('_'))
  end
end
