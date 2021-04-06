Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    scope :v1 do
      resources :mentors, only: []do
        # get :agenda
        resources :appointments, except: [:edit, :new]
      end
    end
  end
end
