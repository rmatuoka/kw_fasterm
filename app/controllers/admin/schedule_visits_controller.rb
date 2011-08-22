class Admin::ScheduleVisitsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @ScheduleVisits = ScheduleVisit.find(:all)
  end

  def show
    @ScheduleVisit = ScheduleVisit.find(params[:id])
  end
  
  def new
    @ScheduleVisit = ScheduleVisit.new
  end

  def create
    @ScheduleVisit = ScheduleVisit.create(params[:schedule_visit])
    
    if @ScheduleVisit.save
      redirect_to admin_schedule_visits_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @ScheduleVisit = ScheduleVisit.find(params[:id])
  end
  
  def update
    @ScheduleVisit = ScheduleVisit.find(params[:id])
    @ScheduleVisit.attributes = params[:schedule_visit]
    
    if @ScheduleVisit.save
      redirect_to admin_schedule_visits_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @ScheduleVisit = ScheduleVisit.find(params[:id])
    
    if @ScheduleVisit.destroy
      redirect_to admin_schedule_visits_path
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
