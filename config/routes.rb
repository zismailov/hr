Rails.application.routes.draw do
  resources :skill_feedbacks
  resources :feedbacks
  resources :invites
  resources :skills
  devise_for :users, controllers:
             { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }

  resources :assessments, only: %i[index] do
    resources :feedbacks, shallow: true
  end

  resources :users, only: %i[index] do
    resources :assessments
  end

  resources :invites, only: %i[create destroy]

  root to: "users#index"
end
