Rails.application.routes.draw do
  resources :skill_feedbacks
  resources :feedbacks
  resources :invites
  resources :skills

  resources :profiles, only: %i[show]
  resources :invites, only: %i[create destroy]

  devise_for :users, controllers:
             { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }

  resources :assessments, only: %i[index] do
    resources :feedbacks, shallow: true
  end

  resources :users, only: %i[index update] do
    resources :assessments
  end

  root to: "users#index"
end
