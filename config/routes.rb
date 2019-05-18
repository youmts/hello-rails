Rails.application.routes.draw do
  resources :blogs do
    resources :entries, except: [:index]
  end

  root to: 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
