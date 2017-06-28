Rails.application.routes.draw do
  get :generate_url, controller: :delegate, action: :generate_url

  root controller: :delegate, action: :index
end
