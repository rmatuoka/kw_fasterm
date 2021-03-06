KwFasterm::Application.routes.draw do


  match 'vantagens' => "static_content#advantages"

  match 'aquisicoes' => "static_content#acquisition"

  #Inicio Namespace Admin
  namespace(:admin){
    resources(:sections){
      resources :categories
    }        
    resources(:categories){
      resources :products
    }      
    resources(:products){
      resources :product_images
    }
    resources(:events){
      resources :event_galleries
    } 
    resources(:event_galleries){
      resources :event_gallery_images
    } 
    resources :sessions
    resources(:dynamic_pages){   
      resources :headers
    }
    resources :highlights
    resources(:notices){
      resources :notice_images
    }   
    resources :users
    resources :headers
    resources :contacts
    resources :newsletters do
      collection do
        get 'export'
      end
    end
    resources(:cases){
     resources :case_images
    }
    resources :schedule_visits
    resources :partners
    resources :testimonials
    resources :resellers do
      collection do
        get "import"
      end
    end
    resources :sellers
    resources(:home){
      resources :home_item
    }
    
    root :to => "home#index"
  }
  #Final Namespace Admin
  
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
  resources(:linhas){
    resources :categorias do
      collection do
        get "embreve"
      end
    end
  }
  resources :instalacao
  resources :imprensa
  resources :hoteleiros
  resources :galerias
  resources :eventos
  resources :empresa
  resources :depoimentos
  resources :categorias
  resources (:cases) {
	collection do
		get 'home'
	end
  }
  resources :contato
	resources :busca do
	  collection do
		get 'resultado'
	  end
	end
  resources :esquemas
  resources :simulations
  resources :home do
    collection do
      get :atualizar
    end
  end
  root :to => "home#index"
  
end
