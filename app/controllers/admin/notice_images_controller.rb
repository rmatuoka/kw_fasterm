class Admin::NoticeImagesController < ApplicationController
  before_filter :load_notice
  layout "admin"
  
  def index
    @NoticeImages = @Notice.notice_images.find(:all)
  end

  def show
    @NoticeImage = @Notice.notice_images.find(params[:id])
  end
  
  def new
    @NoticeImage = @Notice.notice_images.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @NoticeImage = @Notice.notice_images.create(params[:notice_image])        
        
        if @NoticeImage.save
            redirect_to admin_notice_notice_images_path
        end
  end

  def edit
    @NoticeImage = @Notice.notice_images.find(params[:id])
  end
  
  def update
    @NoticeImage = @Notice.notice_images.find(params[:id])
    @NoticeImage.attributes = params[:notice_image]
  
    if @NoticeImage.save
      redirect_to admin_notice_notice_images_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @NoticeImage = @Notice.notice_images.find(params[:id])
    
    if @NoticeImage.destroy
      redirect_to admin_notice_notice_images_path
    end
  end

  def load_notice
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @Notice = Notice.find(params[:notice_id])    
  end
end
