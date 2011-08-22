class Admin::EventGalleriesController < ApplicationController
  before_filter :load_event
  layout "admin"
  
  def index
    @EventGalleries = @Event.event_galleries.find(:all)
  end

  def show
    @EventGallery = @Event.event_galleries.find(params[:id])
  end
  
  def new
    @EventGallery = @Event.event_galleries.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @EventGallery = @Event.event_galleries.create(params[:event_gallery])        
        
        if @EventGallery.save
            redirect_to admin_event_event_galleries_path
        end
  end

  def edit
    @EventGallery = @Event.event_galleries.find(params[:id])
  end
  
  def update
    @EventGallery = @Event.event_galleries.find(params[:id])
    @EventGallery.attributes = params[:event_gallery]
  
    if @EventGallery.save
      redirect_to admin_event_event_galleries_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @EventGallery = @Event.event_galleries.find(params[:id])
    
    if @EventGallery.destroy
      redirect_to admin_event_event_galleries_path
    end
  end

  def load_event
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @Event = Event.find(params[:event_id])    
  end
end
