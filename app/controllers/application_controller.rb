class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def navegadorie6
    if browser.safari?
      redirect_to atualizar_index_path
    end 
    if browser.firefox?
      redirect_to atualizar_index_path
    end
    if browser.chrome?
      redirect_to atualizar_index_path
    end
  end
end
