class Artwork < ActiveRecord::Base
  has_attached_file :s3,
  styles: {
    thumb: '100x100>',
    medium: '300x300>'
  },
  :storage => :s3,
  :bucket => "petermcburneyartwork",
  :s3_region => ENV['AWS_REGION'],
  :s3_host_name => 's3-us-west-2.amazonaws.com',
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  },
  :url =>':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename'

  validates :title, presence: true
  validates_attachment_content_type :s3, :content_type => /\Aimage\/.*\Z/
end
