Rails.application.routes.draw do

  get 'dashboard/graph'
  get 'dashboard/piechart'
  post 'dashboard/piechart'


  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  	resources :incomes
  	resources :income_categories
  	resources :expenditures
  	resources :expenditure_categories

  	root 'dashboard#graph'
end
