Rails.application.routes.draw do
  get :generate_url, controller: :delegate, action: :generate_url
  get :delegators, controller: :delegate, action: :delegators

  root controller: :delegate, action: :index
end
