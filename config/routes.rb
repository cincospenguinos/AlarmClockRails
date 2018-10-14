Rails.application.routes.draw do
  resources :playlists
  resources :alarms

  post '/stop', to: 'sounding_alarm#shutdown'
  post '/playlists/:id/add', to: 'playlists#add_song', as: 'add_song'
  
  root 'alarms#index'
end
