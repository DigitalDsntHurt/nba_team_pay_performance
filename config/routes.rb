Rails.application.routes.draw do
  resources :team_seasons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/graph', to: 'team_seasons#graph'

end
