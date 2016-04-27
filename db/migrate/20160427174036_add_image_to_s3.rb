class AddImageToS3 < ActiveRecord::Migration
  def self.up
    add_attachment :artworks, :s3_file
  end

  def self.down
    remove_attachment :artworks, :s3_file
  end
end
