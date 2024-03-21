Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  # API custom routes
  get 'v1/users/:user_id/expenses', to: 'v1/users/expenses#index', as: :user_expenses
  get 'v1/users/:user_id/expenses/:id', to: 'v1/users/expenses#show', as: :user_expense
  post 'v1/users/:user_id/expenses', to: 'v1/users/expenses#create', as: :create_user_expense
  patch 'v1/users/:user_id/expenses/:id', to: 'v1/users/expenses#update', as: :update_user_expense
  delete 'v1/users/:user_id/expenses/:id', to: 'v1/users/expenses#destroy', as: :delete_user_expense
  get 'v1/users/:user_id/expenses/summary', to: 'v1/users/expenses#summary', as: :user_expenses_summary

  # API routes
  # namespace :v1 do
  #   # resources :users, shallow: true
  #
  #   resources :users do
  #     resources :expenses, shallow: true do
  #       get 'summary', on: :member
  #     end
  #   end
  # end
end
