Rails.application.routes.draw do
  resources :playlists
  resources :alarms

  post '/stop', to: 'sounding_alarm#shutdown'
  
  post '/playlists/:id/add', to: 'playlists#add_song', as: 'add_song'
  delete '/playlists/:id/remove', to: 'playlists#remove_song', as: 'remove_song'
  
  root 'alarms#index'
end
