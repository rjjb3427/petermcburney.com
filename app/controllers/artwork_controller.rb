class ArtworkController < ApplicationController
  # basic authentication for all pages except index, copic, sketches, paintings, and for_sale (public facing views)
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index, :copic, :sketches, :paintings, :for_sale]

  # ***************************
  # Create Methods
  # ***************************

  # Instantiate a new artwork with default parameters
  def new
    @artwork = Artwork.new(:artwork_type => "painting", :featured => "false", :for_sale => "false")
  end

  # Create artwork and save to database, redirect to admin panel
  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      redirect_to :controller => 'welcome', :action => 'admin'
    else
      redirect_to :controller => 'artwork', :action => 'new'
    end
  end

  # ***************************
  # Read Methods
  # ***************************

  # Aggregate by featured artwork (featured boolean)
  def index
     @artwork = Artwork.where(:featured => true).order(:order)
  end

  # Aggregate by copic marker paintings
  def copic
    @copic = Artwork.where(:artwork_type => 'copic').order(:order)
  end

  # Aggregate by sketches
  def sketches
    @sketches = Artwork.where(:artwork_type => 'sketch').order(:order)
  end

  # Aggregate by paintings
  def paintings
    @paintings = Artwork.where(:artwork_type => 'painting').order(:order)
  end

  # Select artwork where for_sale is true
  def for_sale
    @for_sale = Artwork.where(:for_sale => true).order(:order)
  end

  #***************************
  # Update Methods
  #***************************

  # Find artwork to be updated
  def edit
    @artwork = Artwork.find(params[:id])
  end

  # Update artwork with new params, redirect to admin panel
  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      redirect_to :controller => 'welcome', :action => 'admin'
    else
      render 'edit'
    end
  end

  # ***************************
  # Delete Methods
  # ***************************

  # Find artwork by id and delete from database, redirect to admin panel
  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy

    redirect_to :controller => 'welcome', :action => 'admin'
  end

  # ***************************
  # Private Methods
  # ***************************

  private
    def artwork_params
      params.require(:artwork).permit(:title, :s3, :image_url, :featured, :order, :artwork_type, :media, :size, :for_sale, :price)
    end
end
