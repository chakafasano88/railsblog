Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index", as: "home"


resources :users
resources :sessions
resources :posts do
  resources :comments
end


end

# GET    /                         home#index
#    users GET    /users(.:format)          users#index
#          POST   /users(.:format)          users#create
# new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#     user GET    /users/:id(.:format)      users#show
#          PATCH  /users/:id(.:format)      users#update
#          PUT    /users/:id(.:format)      users#update
#          DELETE /users/:id(.:format)      users#destroy
