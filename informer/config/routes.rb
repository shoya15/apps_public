Rails.application.routes.draw do
  resource :posts, only: %i[new create destroy]
  resource :contacts, only: %i[new create]
  root to: 'posts#destroy'
  get '/about', to: 'welcome#about'
  get '/complete', to: 'welcome#complete'
end
