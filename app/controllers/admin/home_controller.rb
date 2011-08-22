class Admin::HomeController < ApplicationController
  before_filter :autentica
  layout "admin"
  
  def autentica
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
  end
end
