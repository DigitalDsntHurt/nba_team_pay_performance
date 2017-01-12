Rails.application.routes.draw do
  get 'other/index'
  get 'other/' => 'other#index'
  get 'other/bar'
  get 'other/line'
  get 'other/scatter'
  get 'other/arc'
  get 'other/tree'
  get 'other/cluster'
  get 'other/pack'
  get 'other/bubble'
  get 'other/histogram'
  get 'other/treemap'
  get 'other/map'
  get 'other/barchart' => 'other#barchart'
  get 'other/barchartcsv' => 'other#barchartcsv'

  resources :team_seasons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'scatter/index'
  get 'scatter' => 'scatter#index'
  get '/scatterchart' => 'scatter#scatterchart'

  get 'bar' => 'bar#index'
  get 'bar/json' => 'bar#json'
#  get 'bar/csv' => 'bar#csv'

end
