Rails.application.routes.draw do

root 'users#index'

#USERS
post '/users/create' => 'users#create'
delete '/users' => 'users#logout'
post '/login' => 'users#login'
get '/users/:id' => 'users#show'

#SONGS
get '/songs' => 'songs#index'
post '/songs/create' => 'songs#create'
get '/songs/:id' => 'songs#show'
post '/songs/playlist' => 'songs#addplay'

end
