class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    @photo.save
    redirect_to photo_path
  end

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

  # Private Methods
  private
    def photo_params
      params.require(:photo).permit(:title, :image_type, :image_url, :location, :featured)
    end
end
