Rails.application.routes.draw do
  devise_for :teams, :controllers => {
 :registrations => 'teams/registrations',
 :sessions => 'teams/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, :only => [:show,:index,:new,:create,:edit,:update,:destroy]
  root "welcome#index"
  resources :welcome, :only =>[:index]
  resources :teams, :only => [:show,:index,:edit,:update,:destroy]
  resources :match_reqs
  resources :facilities
  resources :relations, :only =>[:create]
  resources :messages, :only =>[:create]
  resources :rooms, :only =>[:create,:show,:index,:edit,:update]
  resources :challenges, :only =>[:new,:create,:destroy]
  resources :friends, only: [:index,:show,:create, :destroy]
  
end
