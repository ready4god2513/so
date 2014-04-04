So::Application.routes.draw do
  

  resources :questions do
    resources :answers
  end

  devise_for :users

  root to: "questions#index"
  
end