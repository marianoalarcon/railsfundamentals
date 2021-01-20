Rails.application.routes.draw do
	get 'articles/new'
	get 'articles/index'
  get 'articles/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	# get "/bienvenida", to: "home#index"
	root 'home#index'
end
