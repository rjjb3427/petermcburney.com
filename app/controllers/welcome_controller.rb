class WelcomeController < ApplicationController
  def index
    @featured_artwork = Artwork.where(:featured => true)
    @featured_photos = Photo.where(:featured => true)
  end
end
