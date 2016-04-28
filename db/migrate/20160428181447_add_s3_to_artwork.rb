class AddS3ToArtwork < ActiveRecord::Migration
  def self.up
    add_attachment :artworks, :s3
  end

  def self.down
    remove_attachment :artworks, :s3
  end
end
