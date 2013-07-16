Adtlist::Application.routes.draw do
  mount Adtadmin::Engine, :at => "adtadmin"
  mount Usermanage::Engine => "/usermanage"
  devise_for :users
  resources :news_lists
  match '/news'=> 'main#news'
  match '/news/:id'=> 'main#news_show', :id => :id
  
  get '/userapi/getactiverandom' => 'userapi#getactiverandom'
  match '/userapi/v1' => 'userapi#v1'
  match '/about'=> 'about#index'

  resources :reviews

  
   root :to => 'main#estate'
   get "main/index"
  match '/estate'=> 'main#estate' 
  match '/news'=> 'main#news'
  match '/news/:id'=> 'main#news_show', :id => :id
  match '/search'=> 'main#search'
  match '/search/:category/:region'=> 'main#search', :region => :region, :category=>:category
  match '/:region/:altname'=> 'main#show', :region => :region, :altname => :altname
end
