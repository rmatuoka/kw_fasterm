class Admin::HeadersController < ApplicationController
  before_filter :load_page
  layout "admin"
  
  def index
    @Headers = @DynamicPage.headers.find(:all)
  end

  def show
    @Header = @DynamicPage.headers.find(params[:id])
  end
  
  def new
    @Header = @DynamicPage.headers.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @Header = @DynamicPage.headers.create(params[:header])        
        
        if @Header.save
            redirect_to admin_dynamic_page_headers_path
        end
  end

  def edit
    @Header = @DynamicPage.headers.find(params[:id])
  end
  
  def update
    @Header = @DynamicPage.headers.find(params[:id])
    @Header.attributes = params[:header]
  
    if @Header.save
      redirect_to admin_dynamic_page_headers_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Header = @DynamicPage.headers.find(params[:id])
    
    if @Header.destroy
      redirect_to admin_dynamic_page_headers_path
    end
  end

  def load_page
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @DynamicPage = DynamicPage.find(params[:dynamic_page_id])    
  end
end
