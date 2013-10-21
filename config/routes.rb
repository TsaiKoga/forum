Forum::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" }

	root to: 'static_pages#home'

	# admin的后台
	namespace :cpanel do
		root to: "home#index"

		resources :nodes
		resources :sections
		resources :topics
		resources :replies
	end

	resources :nodes

	match "/topics/node:id", to: "topics#node", via: "get", as: "node_topics"		# node:id

	match "/about", to: "static_pages#about", via: "get"

  match "/cool_site", to: "static_pages#cool_site", via: "get"
  match "/member", to: "static_pages#member", via: 'get'

	# match "/:name", to: "static_pages#index", via: 'get', as: 'user'
	# match "/:name/topics", to: "static_pages#topics", via: 'get', as: 'user_topics'
	# match "/:name/favorites", to: "static_pages#favorites", via: 'get', as: 'user_favorites'
	# match "/:name/notes", to: "static_pages#notes", via: 'get', as: 'user_notes'
	resources :topics do
		member do
			post :reply
		end
		collection do
			post :preview
			get :popular
			get :last
		end
		resources :replies
	end

	resources :notifications, only: [:index, :destroy] do
		collection do
			post :clear
		end
	end

	# 保持 User 的 routes 在所有路由的最后，以便于可以让用户名在根目录下面使用，而又不影响到其他的 routes
	resources :users, :path => "" do
		member do
			get :topics
			get :favorites
			get :notes
		end
	end

end
