Rails.application.routes.draw do
    get 'welcome/index'

    # If only using articles, just include line below.
    # resources :articles

    # If using articles and comments, include lines below.
    resources :articles do
        resources :comments
    end

    root 'welcome#index'

end
