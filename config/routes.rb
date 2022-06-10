Rails.application.routes.draw do
  resources :transactions do 
    collection do 
      get 'by_store'
    end
  end
  resources :type_transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
