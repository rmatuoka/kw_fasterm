class Admin::HighlightsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  def index
    @Highlights = Highlight.find(:all)
  end

  def show
    @Highlight = Highlight.find(params[:id])
  end
  
  def new
    @Highlight = Highlight.new
  end

  def create
    @Highlight = Highlight.create(params[:highlight])
    
    if @Highlight.save
      redirect_to admin_highlights_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Highlight = Highlight.find(params[:id])
  end
  
  def update
    @Highlight = Highlight.find(params[:id])
    @Highlight.attributes = params[:highlight]
    
    if @Highlight.save
      redirect_to admin_highlights_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Highlight = Highlight.find(params[:id])
    
    if @Highlight.destroy
      redirect_to admin_highlights_path
    end
  end

  def autentica
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
  end
end
