class Admin::CaseImagesController < ApplicationController
  before_filter :load_case
  layout "admin"
  
  def index
    @CaseImages = @Case.case_images.find(:all)
  end

  def show
    @CaseImage = @Case.case_images.find(params[:id])
  end
  
  def new
    @CaseImage = @Case.case_images.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @CaseImage = @Case.case_images.create(params[:case_image])        
        
        if @CaseImage.save
            redirect_to admin_case_case_images_path
        else
            flash[:msg] = "Erro ao atualizar os, verifique os erros."
            render :action => "edit"
        end
  end

  def edit
    @CaseImage = @Case.case_images.find(params[:id])
  end
  
  def update
    @CaseImage = @Case.case_images.find(params[:id])
    @CaseImage.attributes = params[:case_image]
  
    if @CaseImage.save
      redirect_to admin_case_case_images_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @CaseImage = @Case.case_images.find(params[:id])
    
    if @CaseImage.destroy
      redirect_to admin_case_case_images_path
    end
  end

  def load_case
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @Case = Case.find(params[:case_id])    
  end
end
