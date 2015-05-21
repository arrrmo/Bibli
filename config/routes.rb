Rails.application.routes.draw do

	scope "(:locale)", locale: /en|fr/ do
		devise_for :users
		
		match '/livres/index',    to:'livres#index', via: :get, as: 'livres/'
		resources :livres
		match '/contact', to: 'pages#contact', via: :get
		match '/about',   to:'pages#about', via: :get
		match '/help',    to:'pages#help', via: :get
		match '/home',    to:'pages#home', via: :get

		get '/:locale' => 'pages#home'
		#get '/:locale/home' => 'pages#home'
		root 'pages#home', as: '/'
		get '/search' => 'livres#search'
		get '/stats' => 'livres#stats'
		
	end
  
 
 
   




end
