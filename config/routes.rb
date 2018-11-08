Rails.application.routes.draw do
 root 'home#index'
 post '/show', to: 'home#show'

 
end
