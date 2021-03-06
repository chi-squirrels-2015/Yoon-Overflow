Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show, :edit, :update]

  put '/questions/:question_id/upvote' => "votes#question_upvote", as: "questions_upvote"
  put '/questions/:question_id/downvote' => "votes#question_downvote", as: "questions_downvote"
  put '/answers/:answer_id/upvote' => "votes#answer_upvote", as: "answer_upvote"
  put '/answers/:answer_id/downvote' => "votes#answer_downvote", as: "answer_downvote"

  get '/questions/:question_id/comments/new' => "comments#question_new", as: "question_comments"
  post '/questions/:question_id/comments/:comment_id' => "comments#question", as: "question_comments_create"

  get '/questions/:question_id/answers/:answer_id/comments/new' => "comments#answer_new", as: "question_answer_comments"
  post '/questions/:question_id/answers/:answer_id/comments/:comment_id' => "comments#answer", as: "question_answer_comments_create"


  resources :questions do
    resources :answers, except: [:index, :show] do
    end
  end



  # resources :votes, only: [:update]

  root to: 'static#index'

end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
