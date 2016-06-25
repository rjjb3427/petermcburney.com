class Photo < ActiveRecord::Base
  has_attached_file :s3,
  :storage => :s3,
  :bucket => "petermcburneyartwork",
  :s3_region => ENV['AWS_REGION'],
  :s3_host_name => 's3-us-west-2.amazonaws.com',
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    :s3_endpoint => "s3-us-west-2"
  },
  :url =>':s3_domain_url'

  validates :title, presence: true
  validates_attachment_content_type :s3, :content_type => /\Aimage\/.*\Z/
end
