class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "test", password: "test", except: [:index]

  def index
    @featured_artwork = Artwork.where(:featured => true)
    @featured_photos = Photo.where(:featured => true)
  end

  def admin
    # Artwork variables
    @featured_artwork = Artwork.where(:featured => true)
    @copic_artwork = Artwork.where(:artwork_type => 'copic')
    @painting_artwork = Artwork.where(:artwork_type => 'painting')
    @sketch_artwork = Artwork.where(:artwork_type => 'sketch')
    @for_sale_artwork = Artwork.where(:for_sale => true)
  end
end
