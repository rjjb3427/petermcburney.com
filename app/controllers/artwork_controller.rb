class ArtworkController < ApplicationController
  http_basic_authenticate_with name: "test", password: "test", except: [:index, :copic, :sketches, :paintings, :for_sale]

  # Create Methods
  def new
  end

  def create
    @artwork = Artwork.new(article_params)

    @artwork.save
    redirect_to :controller => 'welcome', :action => 'admin'
  end

  # Read Methods
  def index
     @artwork = Artwork.where(:featured => true)
  end

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
      params.require(:artwork).permit(:title, :image_url, :artwork_type, :media, :size, :for_sale, :price)
    end
end
