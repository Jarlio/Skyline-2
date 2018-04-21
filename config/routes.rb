Rails.application.routes.draw do

  devise_for :users

  get '/user/:username' => 'user#show'

  root 'welcome#index'
end
