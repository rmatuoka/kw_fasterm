class BuscaController < ApplicationController
  before_filter :navegadorie6
  def index
  end
	def resultado
		if !params[:keyword].blank?
		  @Produtos = Category.search_for(params[:keyword])
		  @Noticias = Notice.search_for(params[:keyword])
		  @Erro = false
		  
		else
		@Erro = true
	end
  end
end
