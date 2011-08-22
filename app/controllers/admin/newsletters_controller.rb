class Admin::NewslettersController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  def index
    @Newsletters = Newsletter.find(:all)
  end

  def show
    @Newsletter = Newsletter.find(params[:id])
  end

  def destroy
    @Newsletter = Newsletter.find(params[:id])
    
    if @Newsletter.destroy
      redirect_to admin_newsletters_path
    end
  end

  def autentica
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
  end
  
  def export
    @Newsletters = Newsletter.find(:all)
  end
end
