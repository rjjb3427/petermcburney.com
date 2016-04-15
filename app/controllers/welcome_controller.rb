class WelcomeController < ApplicationController
  def index
    @artwork = Article.where(:featured => true)
  end
end
