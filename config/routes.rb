Rails.application.routes.draw do
  resources :playlists
  resources :alarms

  post '/stop', to: 'sounding_alarm#shutdown'
  
  root 'alarms#index'
end
