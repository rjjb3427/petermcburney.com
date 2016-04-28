class ArtworkController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index, :copic, :sketches, :paintings, :for_sale]

  # Create Methods
  def new
  end

  def create
    puts 'create'
    @artwork = Artwork.new(article_params)

    @artwork.save
    redirect_to :controller => 'welcome', :action => 'admin'
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
  # enter delete logic here

  # Private Methods
  private
    def artwork_params
      params.require(:artwork).permit(:title, :image_url, :featured, :order, :artwork_type, :media, :size, :for_sale, :price)
    end
end
