class ArtworkController < ApplicationController

  def copic
    @copic = Artwork.where(:artwork_type => 'copic')
  end

  def index
     @artwork = Artwork.all
  end

  def new
  end

  def paintings
    @paintings = Artwork.where(:artwork_type => 'painting')
  end
end
