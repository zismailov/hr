Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :skills
  resources :skill_feedbacks, only: %i[create update]

  resources :feedbacks, only: %i[show edit]
  resources :invites, only: %i[index create destroy]

  resources :assessments, only: %i[index] do
    resources :feedbacks, only: %i[new create update]
  end

  resources :users, only: %i[show index update] do
    resources :assessments
  end

  root to: "users#index"
end
