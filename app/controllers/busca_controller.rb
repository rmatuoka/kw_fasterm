class BuscaController < ApplicationController
  before_filter :navegadorie6
  def index
  end
	def resultado
		if !params[:keyword].blank?
		  key = "%"+params[:keyword]+"%"
		  @Produtos = Category.find(:all, :conditions=>["(title LIKE ? OR description LIKE ?) and published = 1",key,key])
		  @Noticias = Notice.find(:all, :conditions=>["(title LIKE ? OR body LIKE ? OR summary LIKE ?) and published = 1",key,key,key])
		  @Erro = false
		  
		else
		@Erro = true
	end
  end
end
