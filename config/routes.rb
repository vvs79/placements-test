Rails.application.routes.draw do
  root 'places#index'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :users, only: [:index, :show]
  resources :places, only: [:index, :show, :new, :create, :destroy] do
    get :select_image, on: :member
  end  
  resources :comments, only: [:new, :create]

  get '*a' => 'places#404'
end
