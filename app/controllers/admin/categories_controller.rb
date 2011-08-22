class Admin::CategoriesController < ApplicationController
  before_filter :load_section, :execpt => [:published]
  layout "admin"
  
  def index
    @Categories = @Section.categories.find(:all)
  end

  def show
    @Category = @Section.categories.find(params[:id])
  end
  
  def new
    @Category = @Section.categories.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @Category = @Section.categories.create(params[:category])        
        
        if @Category.save
            redirect_to admin_section_categories_path
        end
  end

  def edit
    @Category = @Section.categories.find(params[:id])
  end
  
  def update
    @Category = @Section.categories.find(params[:id])
    @Category.attributes = params[:category]
  
    if @Category.save
      redirect_to admin_section_categories_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Category = @Section.categories.find(params[:id])
    
    if @Category.destroy
      redirect_to admin_section_categories_path
    end
  end

  def load_section
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @Section = Section.find(params[:section_id])
  end
end
