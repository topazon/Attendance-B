Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'user#new'
end