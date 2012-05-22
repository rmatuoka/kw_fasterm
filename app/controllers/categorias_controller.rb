class CategoriasController < ApplicationController
  before_filter :navegadorie6
  def show
    @Section = Section.find(params[:linha_id])
    @Categoria = @Section.categories.find(params[:id])  
    @Produtos = @Categoria.products.find(:all, :conditions => ['published = 1'], :order => 'orderprod, title')   
  end
  
  def embreve
    
  end

end
