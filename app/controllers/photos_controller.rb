class PhotosController < ApplicationController
  def index
    @photos = Photo.where(:featured => true)
  end

  def nature
    @nature = Photo.where(:image_type => "nature")
  end

  def wildlife
    @wildlife = Photo.where(:image_type => "wildlife")
  end

  def locations
    @locations = Photo.where(:image_type => "locations")
  end
end
