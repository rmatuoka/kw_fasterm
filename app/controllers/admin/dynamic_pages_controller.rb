class Admin::DynamicPagesController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @DynamicPages = DynamicPage.find(:all)
  end

  def show
    @DynamicPage = DynamicPage.find(params[:id])
  end
  
  def new
    @DynamicPage = DynamicPage.new
  end

  def create
    @DynamicPage = DynamicPage.create(params[:dynamic_page])
    
    if @DynamicPage.save
      redirect_to admin_dynamic_pages_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @DynamicPage = DynamicPage.find(params[:id])
  end
  
  def update
    @DynamicPage = DynamicPage.find(params[:id])
    @DynamicPage.attributes = params[:dynamic_page]
    
    if @DynamicPage.save
      redirect_to admin_dynamic_pages_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @DynamicPage = DynamicPage.find(params[:id])
    
    if @DynamicPage.destroy
      redirect_to admin_dynamic_pages_path
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
