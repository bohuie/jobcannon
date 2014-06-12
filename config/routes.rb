First_Website::Application.routes.draw do
  resources :authentications

  devise_for :users, :controllers => { :registrations => 'registrations' }
  
  #devise_scope :user do 

  root to: 'static_pages#home'

  resources :skills do 
    get :autocomplete_skilllabel_label, :on => :collection
  end
  
  scope module: 'survey/tech' do
    resources :word_processing_fluentcies, :formats => "js"
    resources :word_processing_skills, :formats => "js"
    
    resources :basic_computer_skills, :formats => "js"
    resources :operating_systems_usages, :formats => "js"
    resources :operating_systems_fluents, :formats => "js"
    
    resources :advanced_computer_skills, :formats => "js"

    resources :multi_media_skills, :formats => "js"
    resources :technology_differences, :formats => "js"

    resources :spreadsheet_skills, :formats => "js"
    resources :spreadsheet_fluentcies, :formats => "js"

    resources :presenting_skills, :formats => "js"
    resources :presenting_fluentcies, :formats => "js"

    resources :email_skills, :formats => "js"
    resources :email_fluentcies, :formats => "js"

    resources :internet_terms, :formats => "js"
    resources :internet_tasks, :formats => "js"
    resources :internet_connections, :formats => "js"
    resources :browsers, :formats => "js"


    resources :social_media_skills, :formats => "js"
    resources :social_media_descs, :formats => "js"
    resources :social_media_platforms, :formats => "js"

    resources :online_colab_skills, :formats => "js"
    resources :online_colab_fluentcies, :formats => "js"

  end

  scope module: 'survey/profile' do 
    resources :languages , :formats => "js"
    resources :surveyprofiles
  end

  scope module: 'survey/personality' do
    resources :communication_skills, :formats => "js"
    resources :thinking_skills, :formats => "js"
    resources :self_direction_skills, :formats => "js"
    resources :accountabilities, :formats => "js"
    resources :interpersonal_skills, :formats => "js"
  end

  resources :experiences
  resources :references
  resources :postings
  resources :projects
  resources :links
  resources :profile
  
  resources :surveys do
    member do
      #post :back, :formats => "js"
    end
  end 

  resources :friendships
  resources :messages
  resources :friendships
  
  resources :layouts
  
  resources :experiencetables do     
    member do 
      patch :vol_update, :formats => "js"
      patch :ft_update, :formats => "js"
      patch :pt_update, :formats => "js"
      patch :employ_update, :formats => "js"
    end 
  end
  #resources :users

  match '/ft_update', to: 'experiencetables#ft_update', via: 'get'
  match '/pt_update', to: 'experiencetables#pt_update', via: 'get'
  match '/vol_update', to: 'experiencetables#vol_update', via: 'get'
  match '/employ_update', to: 'experiencetables#employ_update', via: 'get'
  match '/search', to: 'search#search', via: 'get'
  match '/findfriend', to: 'friendships#findfriend', via: 'get'
  match '/results', to: 'surveys#add', via: 'post'
  match '/reccomended', to: 'skills#reccomend', via:'get'
  match '/details', to: 'experiences#details', via: 'get'
  match '/one_ref', to: 'references#one_ref', via: 'get'
  match '/add_exp', to: "experiences#add", via: 'get'
  get 'privatechat', to: "layouts#privatechat", via: 'get'
    
  match '/auth/:provider/callback', to: 'authentications#create', via: 'get'
  resources :authentications

  get  'addfriend', to: 'friendships#addfriend'
  post  'addfriend', to: 'friendships#addfriend'
  get  'accept', to: 'friendships#accept'
  get  'decline', to: 'friendships#decline'
  get 'network', to: 'friendships#index'
  get 'privatechat', to: 'messages#privatechat'
  get 'storemsg', to: 'messages#storemsg'
  post 'vol_update', to: 'survey#show'
  get 'surveys/back', to: 'surveys#back'


   # get 'signin' => 'devise/sessions#new', :as => :new_user_session
   # post 'signin' => 'devise/sessions#create', :as => :user_session
   # delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
   # match '/sessions/user', to: 'devise/sessions#create', via: :post
 # end
  




  
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
end