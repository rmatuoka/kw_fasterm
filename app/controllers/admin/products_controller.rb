class Admin::ProductsController < ApplicationController
  before_filter :load_category
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Products = @Category.products.find(:all)
  end

  def show
    @Product = @Category.products.find(params[:id])
  end
  
  def new
    @Product = @Category.products.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @Product = @Category.products.create(params[:product])        
        
        if @Product.save
            redirect_to admin_category_products_path
        end
  end

  def edit
    @Product = @Category.products.find(params[:id])
  end
  
  def update
    @Product = @Category.products.find(params[:id])
    @Product.attributes = params[:product]
  
    if @Product.save
      redirect_to admin_category_products_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Product = @Category.products.find(params[:id])
    
    if @Product.destroy
      redirect_to admin_category_products_path
    end
  end

  def load_category
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @Category = Category.find(params[:category_id])    
  end
end
