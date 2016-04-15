class WelcomeController < ApplicationController
  def index
    @featured_artwork = Artwork.where(:featured => true)
  end
end
