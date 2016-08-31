###
# Photos controller
# Coded by: Andrew McBurney
###

class PhotosController < ApplicationController
  # basic authentication for all pages except index, show, nature, wildlife and locations (public facing views)
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index, :show, :nature, :wildlife, :locations]

  # ***************************
  # Create Methods
  # ***************************

  # Instantiate new photo with default parameters
  def new
    @photo = Photo.new(:image_type => "nature", :featured => "false")
  end

  # Create photo and save to database, redirect to admin panel
  def create
    @photo = Photo.new(photo_params)

    @photo.save
    redirect_to :controller => 'welcome', :action => 'admin'
  end

  # ***************************
  # Read Methods
  # ***************************


  # Aggregate by featured photos (featured boolean)
  def index
    @photos = Photo.where(:featured => true).order(:order)
  end

  # Aggregate by nature photos
  def nature
    @nature = Photo.where(:image_type => "nature").order(:order)
  end

  # Aggregate by wildlife photos
  def wildlife
    @wildlife = Photo.where(:image_type => "wildlife").order(:order)
  end

  # Aggregate by location photos
  def locations
    @locations = Photo.where(:image_type => "locations").order(:order)
  end

  #***************************
  # Update Methods
  #***************************

  # Find photo to be updated
  def edit
    @photo = Photo.find(params[:id])
  end

  # Updated photo with new params, redirect to admin panel
  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to :controller => 'welcome', :action => 'admin'
    else
      render 'edit'
    end
  end

  # ***************************
  # Delete Methods
  # ***************************

  # Find a photo by id and delete from database, redirect to admin panel
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to :controller => 'welcome', :action => 'admin'
  end

  # ***************************
  # Private Methods
  # ***************************

  private
    def photo_params
      params.require(:photo).permit(:title, :image_type, :image_url, :location, :featured, :order)
    end
end
