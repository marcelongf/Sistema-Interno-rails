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

  post '/addnewmembertoproject', to: 'projects#addNewMember', as: 'new_member'

  get '/mytasks', to: 'users#myTasks', as: 'mytasks'
  post 'updatecelltask', to: 'cell_goal#updateTask', as: 'update_cell_task'
  post 'updatedirtask', to: 'directorship_goals#updateTask', as: 'update_dir_task'


  post 'likespost', to: 'posts#like', as: 'post_like'
  post 'dislikepost', to: 'post#dislike', as: 'post_dislike'


  get '/skilltree', to: 'users#skilltree', as: 'skilltree'

  resources :users
  resources :posts do
    member do 
      put 'like' => 'posts#like'
    end
  end
  resources :articles do 
    member do 
      put 'like'=> 'articles#like'
    end
  end
  #put 'likearticle', to: 'articles#like', as: 'like_article'

  resources :skills

  resources :projects
  resources :cells
  resources :directorships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
