Rails.application.routes.draw do

  get 'dashboard/welcome'

  	devise_for :users
  	resources :incomes
  	resources :income_categories
  	resources :expenditures
  	resources :expenditure_categories

  	root 'homepage#homepage'
end
