Rails.application.routes.draw do
  devise_for :usuarios
  resources :filiais
  resources :filiais
  resources :cargos
  resources :setores
  resources :funcionarios do
  	collection do
    	get :listar
  	end
  end

  get 'paginas/index'

  get 'paginas/localizacao'
  root :to => 'paginas#index'

end
