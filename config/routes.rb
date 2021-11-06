Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecasts, only: %i[index]   
    end
  end
end
