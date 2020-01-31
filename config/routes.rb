Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#get '/'

#Key work, URL, Controller/Action, Alisas 
get '/contact', to: 'contact#index', as: 'contacts'

#Creating new contact 
get '/contact/new', to: 'contact#new', as: 'new_contact'
post '/contact', to: 'contact#create', as: 'create_contact'

#Read contact 
get '/contact/:id', to: 'contact#show', as: 'contact'

#Edit contact
get '/contact/:id/edit', to: 'contact#edit', as: 'edit_contact'
patch '/contact/:id', to: 'contact#update'
put '/contact/:id', to: 'contact#update'

#Delete contact 
delete '/contact/:id', to: 'contact#destroy', as: 'destroy_contact'

end
