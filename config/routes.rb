ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :has_many => :comments
  
  map.root :controller => 'posts'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
