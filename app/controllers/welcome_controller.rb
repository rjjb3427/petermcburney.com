class WelcomeController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index]

  def index
    @featured_artwork = Artwork.where(:featured => true).order(:order)
    @featured_photos = Photo.where(:featured => true)
  end

  def admin
    # Artwork variables
    @featured_artwork = Artwork.where(:featured => true).order(:order)
    @copic_artwork = Artwork.where(:artwork_type => 'copic').order(:order)
    @painting_artwork = Artwork.where(:artwork_type => 'painting').order(:order)
    @sketch_artwork = Artwork.where(:artwork_type => 'sketch').order(:order)
    @for_sale_artwork = Artwork.where(:for_sale => true).order(:order)
  end
end
