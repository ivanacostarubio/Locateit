ActionController::Routing::Routes.draw do |map|
  map.resources :tiendas
  map.resources :buscar
  
  map.root :controller => :tiendas, :action => :index
    
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
