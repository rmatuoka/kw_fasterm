KwFasterm::Application.routes.draw do
  
  resources :atualizar
  resources :visitas
  resources :testimonials
  resources :sustentabilidade
  resources :sitecontacts
  resources :sessions
  resources :servicos
  resources :schedule_visits
  resources :request_catalogs
  resources :produtos
  resources :noticias
  resources :newsletters
  resources :linhas
  resources :instalacao
  resources :imprensa
  resources :hoteleiros
  resources :galerias
  resources :eventos
  resources :empresa
  resources :depoimentos
  resources :categorias
  resources :cases
  resources :contato
  resources :busca
  resources :home do
    collection do
      get :atualizar
    end
  end
  root :to => "home#index"
  
end
