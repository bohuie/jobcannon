First_Website::Application.routes.draw do
  root :to => 'static_pages#home'
  resources :authentications, only: [:new, :destroy]

  devise_for :users, :controllers => { :registrations => 'registrations' }

  resources :skills do 
    get :autocomplete_skilllabel_label, :on => :collection, :formats => "js"
  end

  resources :interests do 
    get :autocomplete_interestlabel_label, :on => :collection
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
  resources :progresses
  resources :endorses
  resources :photos
  resources :shopping_lists
  resources :flagged_candidates
  resources :flagged_jobs
  
  resources :surveys do
    member do
      get :back, :formats => "js"
    end
  end 

  resources :friendships, only: [:new, :create, :destroy]
  resources :messages
  resources :network_searches
  
  resources :layouts
  
  resources :experiencetables do     
    member do 
      patch :vol_update, :formats => "js"
      patch :ft_update, :formats => "js"
      patch :pt_update, :formats => "js"
      patch :employ_update, :formats => "js"
    end 
  end

<<<<<<< HEAD
  match '/show_results', to:'surveys#results', via: 'get'
=======
>>>>>>> f525c470cbce5b41f808865a5e8f71be2774a00f
  match '/show_network', to:'friendships#show', via: 'get'
  match '/ft_update', to: 'experiencetables#ft_update', via: 'get'
  match '/pt_update', to: 'experiencetables#pt_update', via: 'get'
  match '/vol_update', to: 'experiencetables#vol_update', via: 'get'
  match '/employ_update', to: 'experiencetables#employ_update', via: 'get'
  match '/search', to: 'search#search', via: 'get'
  match '/findfriend', to: 'friendships#findfriend', via: 'get'
  match '/findcompany', to: 'friendships#findcompany', via: 'get'
  match '/results', to: 'surveys#add', via: 'post'
  match '/reccomended', to: 'skills#reccomend', via:'get'
  match '/details', to: 'experiences#details', via: 'get'
  match '/one_ref', to: 'references#one_ref', via: 'get'
  match '/add_exp', to: "experiences#add", via: 'get'
  match '/resume', to: "profile#resume", via: 'get'
  get 'privatechat', to: "layouts#privatechat", via: 'get'
    
  match '/auth/:provider/callback', to: 'authentications#create', via: 'get'

  get  'addfriend', to: 'friendships#addfriend'
  post  'addfriend', to: 'friendships#addfriend'
  get  'addcompany', to: 'friendships#addcompany'
  post  'addcompany', to: 'friendships#addcompany'
  get  'accept', to: 'friendships#accept'
  get  'decline', to: 'friendships#decline'
  get 'network', to: 'friendships#index'
  get 'privatechat', to: 'messages#privatechat'
  get 'storemsg', to: 'messages#storemsg'
  get 'employee_list', to: 'shopping_lists#index'
  get 'flagged', to: 'postings#flagged'
  get 'people', to: 'postings#people'
  get 'candidate', to: 'postings#candidate'
end