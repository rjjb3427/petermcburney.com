class Artwork < ActiveRecord::Base
  has_attached_file :s3,
   :storage => :s3,
   :bucket => "petermcburneyartwork",
   :s3_region => ENV['AWS_REGION'],
   :s3_credentials => {
     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
   },
   :url =>':s3_domain_url',
   :path => '/uploads/:attachment/:id_partition/:filename'

  validates_attachment_content_type :s3, :content_type => /\Aimage\/.*\Z/
end
