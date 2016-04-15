class ArtworkController < ApplicationController

  def copic

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
