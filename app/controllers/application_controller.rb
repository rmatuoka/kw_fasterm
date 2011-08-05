class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def navegadorie6
    if browser.ie6?
      redirect_to atualizar_index_path
    end 
  end
  
  
end
