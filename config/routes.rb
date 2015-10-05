Rails.application.routes.draw do


  root 'start#groups'
  
  get '/welcome',         to: 'start#welcome', as: 'welcome'
  get '/whats-your-name', to: 'start#name',    as: 'name'
  get '/start-game',      to: 'start#play',    as: 'play'
  

  get '/play',      to: 'game#play!', as: 'game_play'
  get '/finished',  to: 'game#finished!', as: 'game_finished'


  scope 'gestao' do 
    resources :results, path: 'resultados'
  end
end
