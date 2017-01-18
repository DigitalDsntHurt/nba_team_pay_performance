Rails.application.routes.draw do

  get 'home' => 'home#index'

  resources :team_seasons


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

  
  get 'bar' => 'bar#index'
  get 'bar/json' => 'bar#json'

  get 'line' => 'line#index'

  get 'scatter' => 'scatter#index'
  get '/scatterchart' => 'scatter#scatterchart'
end
