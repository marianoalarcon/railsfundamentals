Rails.application.routes.draw do
  
  devise_for :admins
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	# Users Admins

	get 'admins', to: 'admins#index'

	# Photos
	#resources :photos
	
	get 'photos/new', as: :new_photos
	post 'photos', to: 'photos#create'
	get 'photos/:id', to:'photos#show'
	get 'photos/:id/edit', to: 'photos#edit'
	patch 'photos/:id', to: 'photos#update', as: :photo
	delete 'photos/:id', to: 'photos#destroy'
	get 'photos', to: 'photos#index'
	#Photos from user admin, relation between tables
	get 'photos/admin/:admin_id', to: 'photos#from_author'
	
	# Articles

	#Articulos de un usuario admin, relacion entre tablas
	get 'articles/admin/:admin_id', to: 'articles#from_author'

	get 'articles/new', to: 'articles#new', as: :new_articles
	get 'articles/:id', to: 'articles#show'
	get 'articles/:id/edit', to: 'articles#edit'
	post 'articles', to: 'articles#create'
	patch 'articles/:id', to: 'articles#update', as: :article
	delete 'articles/:id', to: 'articles#destroy'
	get 'articles', to: 'articles#index'
	

	# get "/bienvenida", to: "home#index"
	root 'home#index'
end
