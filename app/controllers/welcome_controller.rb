# TODO:
# think about aggregating the admin side further
# so that you're not rendering all of the images
# in a single place (improve loading time)

class WelcomeController < ApplicationController
  # basic authentication for admin panel
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index]

  # ***************************
  # Main Landing Page
  # ***************************

  def index
    # Featured collections
    @featured_artwork = Artwork.where(:featured => true).order(:order)
    @featured_photos = Photo.where(:featured => true).order(:order)
  end

  # ***************************
  # Admin Panel for Dad
  # ***************************

  def admin
    # Artwork collections
    @featured_artwork = Artwork.where(:featured => true).order(:order)
    @for_sale_artwork = Artwork.where(:for_sale => true).order(:order)
    @copic_artwork = Artwork.where(:artwork_type => 'copic').order(:order)
    @painting_artwork = Artwork.where(:artwork_type => 'painting').order(:order)
    @sketch_artwork = Artwork.where(:artwork_type => 'sketch').order(:order)

    # Photo collections
    @featured_photos = Photo.where(:featured => true).order(:order)
    @nature_photos = Photo.where(:image_type => "nature").order(:order)
    @wildlife_photos = Photo.where(:image_type => "wildlife").order(:order)
    @location_photos = Photo.where(:image_type => "locations").order(:order)
  end
end
