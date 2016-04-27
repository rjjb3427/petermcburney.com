class Artwork < ActiveRecord::Base
  has_attached_file :s3_file, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :s3_file, :content_type => /\Aimage\/.*\Z/
end
