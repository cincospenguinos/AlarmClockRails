Rails.application.routes.draw do
  resources :playlists
  resources :alarms
  
  root 'alarms#index'
end
