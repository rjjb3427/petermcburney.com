class ArtworkController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index, :copic, :sketches, :paintings, :for_sale]

  # Create Methods
  def new
    @artwork = Artwork.new(:artwork_type => "painting", :featured => "false", :for_sale => "false")
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      redirect_to :controller => 'welcome', :action => 'admin'
    else
      redirect_to :controller => 'artwork', :action => 'new'
    end
  end

  # Read Methods
  def index
     @artwork = Artwork.where(:featured => true).order(:order)
  end

  def copic
    @copic = Artwork.where(:artwork_type => 'copic').order(:order)
  end

  def sketches
    @sketches = Artwork.where(:artwork_type => 'sketch').order(:order)
  end

  def paintings
    @paintings = Artwork.where(:artwork_type => 'painting').order(:order)
  end

  def for_sale
    @for_sale = Artwork.where(:for_sale => true).order(:order)
  end

  # Update Methods
  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      redirect_to :controller => 'welcome', :action => 'admin'
    else
      render 'edit'
    end
  end

  # Delete Methods
  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy

    redirect_to :controller => 'welcome', :action => 'admin'
  end

  # Private Methods
  private
    def artwork_params
      params.require(:artwork).permit(:title, :s3, :image_url, :featured, :order, :artwork_type, :media, :size, :for_sale, :price)
    end
end
