class Admin::ContactsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  def index
    @Contacts = Sitecontact.find(:all , :order => "id DESC")
  end

  def show
    @Contact = Sitecontact.find(params[:id])
  end

  def destroy
    @Contact = Sitecontact.find(params[:id])
    
    if @Contact.destroy
      redirect_to admin_contacts_path
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
