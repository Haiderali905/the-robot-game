Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'robots#index'

  get '/robot/place' => 'robots#place'
  get '/robot/move' => 'robots#move'
  get '/robot/rotate' => 'robots#rotate'
end
