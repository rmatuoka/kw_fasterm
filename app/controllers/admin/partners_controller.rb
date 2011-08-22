class Admin::PartnersController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Partners = Partner.find(:all)
  end

  def show
    @Partner = Partner.find(params[:id])
  end
  
  def new
    @Partner = Partner.new
  end

  def create
    @Partner = Partner.create(params[:partner])
    
    if @Partner.save
      redirect_to admin_partners_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Partner = Partner.find(params[:id])
  end
  
  def update
    @Partner = Partner.find(params[:id])
    @Partner.attributes = params[:partner]
    
    if @Partner.save
      redirect_to admin_partners_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Partner = Partner.find(params[:id])
    
    if @Partner.destroy
      redirect_to admin_partners_path
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
