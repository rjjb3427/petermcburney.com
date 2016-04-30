class PhotosController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index, :show, :nature, :wildlife, :locations]

  # Create Methods
  def new
    @photo = Photo.new(:image_type => "nature", :featured => "false")
  end

  def create
    @photo = Photo.new(photo_params)

    @photo.save
    redirect_to :controller => 'welcome', :action => 'admin'
  end

  # Read Methods
  def index
    @photos = Photo.where(:featured => true).order(:order)
  end

  def nature
    @nature = Photo.where(:image_type => "nature").order(:order)
  end

  def wildlife
    @wildlife = Photo.where(:image_type => "wildlife").order(:order)
  end

  def locations
    @locations = Photo.where(:image_type => "locations").order(:order)
  end

  # Update Methods
  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to :controller => 'welcome', :action => 'admin'
    else
      render 'edit'
    end
  end

  # Private Methods
  private
    def photo_params
      params.require(:photo).permit(:title, :image_type, :image_url, :location, :featured, :order)
    end
end
