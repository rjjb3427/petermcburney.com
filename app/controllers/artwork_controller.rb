class ArtworkController < ApplicationController

  def copic
    @copic = Artwork.where(:artwork_type => 'copic')
  end

  def sketches
    @sketches = Artwork.where(:artwork_type => 'sketch')
  end

  def paintings
    @paintings = Artwork.where(:artwork_type => 'painting')
  end

  def for_sale
    @for_sale = Artwork.where(:for_sale => true)
  end

  def index
     @artwork = Artwork.all
  end

  def new
  end

end
