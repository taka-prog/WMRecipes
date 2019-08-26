Rails.application.routes.draw do
  devise_for :users
  resource :recipes
  root to: 'recipes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'recipes#about'


  get 'registration_recipe' => 'recipes#registration_recipe'
  get 'recipe/:id' => 'recipes#show_recipe', as: 'show_recipe'
  get 'recipe/:id/edit' => 'recipes#edit', as: 'edit_recipe'
  patch 'recipe/:id' => 'recipes#update', as: 'update_recipe'
  delete 'destroy/:id' => 'recipes#destroy', as: 'destroy_recipe'

  get 'user/:id' => 'users#show', as: 'show_user'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  patch 'users/:id' => 'users#update', as: 'update_user'
end
