So::Application.routes.draw do

  concern :comment_and_vote do
    resources :comments
    resources :votes
  end
  

  resources :questions, concerns: :comment_and_vote do
    resources :answers
  end

  resources :answers, only: [], concerns: :comment_and_vote

  resources :comments, only: [] do
    resources :votes
  end

  devise_for :users
  resources :user, only: :show

  root to: "questions#index"
  
end