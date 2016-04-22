Rails.application.routes.draw do

  # Static artwork pages
  get 'artwork/copic'
  get 'artwork/paintings'
  get 'artwork/sketches'
  get 'artwork/for_sale'

  # Static photo pages
  get 'photos/nature'
  get 'photos/wildlife'
  get 'photos/locations'

  resources :artwork, :photos, :profile, :contact, :commissions

  root 'welcome#index'
  
end
