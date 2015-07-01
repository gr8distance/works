Rails.application.routes.draw do

  resources :works do

		member do
			#delete :end_work
		end
	end

  resources :staffs
  devise_for :users
  root 'home#index'

end
