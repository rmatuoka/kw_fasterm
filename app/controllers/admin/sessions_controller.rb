class Admin::SessionsController < ApplicationController
  layout "admin"

  def create
    @User = User.find(:first, :conditions => ['email = ? AND password = ?', params[:email], params[:senha]])

    if @User
      session[:logged] = true
      session[:login] = @User.email
      redirect_to admin_sections_path
    else
      flash[:msg] = "Usuário e/ou senha inválidos."
      render :action => "new"
    end
  end

  def destroy
    session[:logged] = false
    redirect_to new_admin_session_path
  end
end
