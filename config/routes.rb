Rails.application.routes.draw do

  post 'users', to: 'users#create'
  devise_for :users
  root to: 'pages#home'

  post '/newcellgoaltask', to: 'cell_goal#createTask', as: 'new_cell_task'
  get '/newcellgoal', to: 'cell_goal#new', as: 'cellgoal'
  post '/newcellgoal', to: 'cell_goal#create', as: 'create_cellgoal'
  get '/showcellgoal', to: 'cell_goal#show', as: 'show_cellgoal'

  post '/newdirectorshipgoaltask', to: 'directorship_goals#createTask', as: 'new_directorship_task'
  get '/newdirectorshipgoal', to: 'directorship_goals#new', as: 'directorshipgoal'
  post '/newdirectorshipgoal', to: 'directorship_goals#create', as: 'create_directorshipgoal'
  get '/showdirectorshipgoal', to: 'directorship_goals#show', as: 'show_directorshipgoal'

  post '/createpostcomment', to: 'posts#createComment', as: 'create_post_comment'

  post '/createarticlecomment', to: 'articles#createComment', as: 'create_article_comment'

  get '/skilltree', to: 'users#skilltree', as: 'skilltree'

  resources :users
  resources :posts
  resources :articles
  resources :skills

  resources :projects
  resources :cells
  resources :directorships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
