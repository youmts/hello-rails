Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "custom/devise/omniauth_callbacks"
  }

  resources :blogs, shallow: true do
    resources :entries, except: [:index] do
      resources :attachments, only: [:index, :create, :new, :destroy]
      resources :comments, only: [:create, :destroy] do
        member do
          put 'approve'
        end
      end
    end
  end

  root to: 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
