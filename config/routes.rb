Rails.application.routes.draw do

  get 'dashboard/graph'
  get 'dashboard/piechart'
  get 'dashboard/chart'
  post 'dashboard/chart'
  post 'dashboard/piechart'


  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  	resources :incomes
  	resources :income_categories
  	resources :expenditures
  	resources :expenditure_categories

  	root 'dashboard#chart'
end
