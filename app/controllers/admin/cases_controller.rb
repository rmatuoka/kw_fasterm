class Admin::CasesController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Cases = Case.find(:all)
  end

  def show
    @Case = Case.find(params[:id])
  end
  
  def new
    @Case = Case.new
  end

  def create
    @Case = Case.create(params[:case])
    
    if @Case.save
      redirect_to admin_cases_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Case = Case.find(params[:id])
  end
  
  def update
    @Case = Case.find(params[:id])
    @Case.attributes = params[:case]
    
    if @Case.save
      redirect_to admin_cases_path
    else
      flash[:msg] = "Erro ao atualizar os dados. Verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Case = Case.find(params[:id])
    
    if @Case.destroy
      redirect_to admin_cases_path
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
