Rails.application.routes.draw do
  #get 'dollar_course/show'
  root 'dollar_course#show'
  get "/admin", to: "dollar_course#set"
  post "/admin", to: "dollar_course#set"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
