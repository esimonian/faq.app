Rails.application.routes.draw do
  root to: 'faqs#index'
  resources :faqs

end
