Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/pets', to: 'shelters#display'


  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  post '/shelters/:shelter_id', to: 'reviews#create'
  get '/shelters/:review_id/reviews/edit', to: 'reviews#edit'
  patch '/reviews/:review_id', to: 'reviews#update'
  delete '/reviews/:review_id', to: 'reviews#destroy'

  get '/favorites', to: 'favorites#index'
  patch '/favorites/:pet_id', to: 'favorites#update'
  delete '/favorites/:pet_id', to: 'favorites#destroy'
  delete '/favorites', to: 'favorites#destroy'

  get '/applications/new', to: 'applications#new'
  post '/applications', to: 'applications#create'
  get '/applications/:application_id', to: 'applications#show'
  get '/pets/:id/applications', to: 'applications#index'
  patch '/pets/:petid/applications/:appid/approve', to: 'pets#change_adoption'
  patch '/pets/:petid/applications/:appid/reject', to: 'pets#change_adoption'
end
