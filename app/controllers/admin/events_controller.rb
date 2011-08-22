class Admin::EventsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Events = Event.find(:all)
  end

  def show
    @Event = Event.find(params[:id])
  end
  
  def new
    @Event = Event.new
  end

  def create
    @Event = Event.create(params[:event])
    
    if @Event.save
      redirect_to admin_events_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Event = Event.find(params[:id])
  end
  
  def update
    @Event = Event.find(params[:id])
    @Event.attributes = params[:event]
    
    if @Event.save
      redirect_to admin_events_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Event = Event.find(params[:id])
    
    if @Event.destroy
      redirect_to admin_events_path
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
