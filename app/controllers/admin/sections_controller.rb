class Admin::SectionsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Sections = Section.find(:all)
  end

  def show
    @Section = Section.find(params[:id])
  end
  
  def new
    @Section = Section.new
  end

  def create
    @Section = Section.create(params[:section])
    
    if @Section.save
      redirect_to admin_sections_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Section = Section.find(params[:id])
  end
  
  def update
    @Section = Section.find(params[:id])
    @Section.attributes = params[:section]
    
    if @Section.save
      redirect_to admin_sections_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Section = Section.find(params[:id])
    
    if @Section.destroy
      redirect_to admin_sections_path
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
