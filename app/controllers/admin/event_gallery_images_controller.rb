class Admin::EventGalleryImagesController < ApplicationController
  before_filter :load_gallery
  layout "admin"
  
  def index
    @Images = @EventGallery.event_gallery_images.find(:all)
  end

  def show
    @Image = @EventGallery.event_gallery_images.find(params[:id])
  end
  
  def new
    @Image = @EventGallery.event_gallery_images.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @Image = @EventGallery.event_gallery_images.create(params[:event_gallery_image])        
        
        if @Image.save
            redirect_to admin_event_gallery_event_gallery_images_path
        end
  end

  def edit
    @Image = @EventGallery.event_gallery_images.find(params[:id])
  end
  
  def update
    @Image = @EventGallery.event_gallery_images.find(params[:id])
    @Image.attributes = params[:event_gallery_image]
  
    if @Image.save
      redirect_to admin_event_gallery_event_gallery_images_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Image = @EventGallery.event_gallery_images.find(params[:id])
    
    if @Image.destroy
      redirect_to admin_event_gallery_event_gallery_images_path
    end
  end

  def load_gallery
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @EventGallery = EventGallery.find(params[:event_gallery_id])    
  end
end
