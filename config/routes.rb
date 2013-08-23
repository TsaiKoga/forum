Forum::Application.routes.draw do
	root to: 'static_pages#home'

  match "/community", to: "static_pages#community", via: "get" 
  match "/cool_site", to: "static_pages#cool_site", via: "get"
  match "/member", to: "static_pages#member", via: 'get'

	match "/about", to: "static_pages#about", via: "get"

end
