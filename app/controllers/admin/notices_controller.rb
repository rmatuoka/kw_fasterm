class Admin::NoticesController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Notices = Notice.find(:all)
  end

  def show
    @Notice = Notice.find(params[:id])
  end
  
  def new
    @Notice = Notice.new
  end

  def create
    @Notice = Notice.create(params[:notice])
    
    if @Notice.save
      redirect_to admin_notices_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Notice = Notice.find(params[:id])
  end
  
  def update
    @Notice = Notice.find(params[:id])
    @Notice.attributes = params[:notice]
    
    if @Notice.save
      redirect_to admin_notices_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Notice = Notice.find(params[:id])
    
    if @Notice.destroy
      redirect_to admin_notices_path
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
