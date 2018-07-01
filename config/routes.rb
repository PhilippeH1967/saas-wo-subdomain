Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' },
                            :path=>'',
                  :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'Profile'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :entreprises

  root 'pages#home'
end
