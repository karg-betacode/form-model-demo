Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'search#search_v1'
  get 'search/search_v1'
  get 'search/search_v2'

end
