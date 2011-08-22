class Admin::UsersController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Users = User.find(:all)
  end

  def show
    @User = User.find(params[:id])
  end
  
  def new
    @User = User.new
  end

  def create
    @User = User.create(params[:user])
    
    if @User.save
      redirect_to admin_users_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @User = User.find(params[:id])
  end
  
  def update
    @User = User.find(params[:id])
    @User.attributes = params[:user]
    
    if @User.save
      redirect_to admin_users_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @User = User.find(params[:id])
    
    if @User.destroy
      redirect_to admin_users_path
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
