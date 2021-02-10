Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  

	# get "/bienvenida", to: "home#index"
	root 'home#index'
  
	# gem Devise
	devise_for :admins
	
	# Users Admins
	#get 'admins', to: 'admins#index'
	#get 'admins/:id', to: 'admins#show', as: :admin
	get 'perfil', to: 'admins#edit'
	resources :admins, only: [:index,:show,:update]
	# Articles	
	#Articulos de un usuario admin, relacion entre tablas
	# get 'articles/admin/:admin_id', to: 'articles#from_author'
	resources :articles do
		get 'admin/:admin_id', to: 'articles#from_author', on: :collection 
		#otra opcion diferente p/otra tarea seria on: :member generaria: articles/:id/admin/:admin_id 
	end
	# get 'articles/new', to: 'articles#new', as: :new_article
	# get 'articles/:id', to: 'articles#show'
	# get 'articles/:id/edit', to: 'articles#edit'
	# post 'articles', to: 'articles#create'
	# patch 'articles/:id', to: 'articles#update', as: :article
	# delete 'articles/:id', to: 'articles#destroy'
	# get 'articles', to: 'articles#index'
	
	
	# Photos
	#resources :photos
	get 'photos/new', as: :new_photo
	post 'photos', to: 'photos#create'
	get 'photos/:id', to:'photos#show'
	get 'photos/:id/edit', to: 'photos#edit', as: :edit_photo
	patch 'photos/:id', to: 'photos#update', as: :photo
	delete 'photos/:id', to: 'photos#destroy'
	get 'photos', to: 'photos#index'
	#Photos from user admin, relation between tables
	get 'photos/admin/:admin_id', to: 'photos#from_author'
	
	#Categories
	resources :categories
end
