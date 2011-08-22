class Admin::ProductImagesController < ApplicationController
  before_filter :load_product
  layout "admin"
  
  def index
    @ProductImages = @Product.product_images.find(:all)
  end

  def show
    @ProductImage = @Product.product_images.find(params[:id])
  end
  
  def new
    @ProductImage = @Product.product_images.build
  end

  def create        
        flash[:msg] = "";
        #PEGA EMAILS
        @ProductImage = @Product.product_images.create(params[:product_image])        
        
        if @ProductImage.save
            redirect_to admin_product_product_images_path
        else
            flash[:msg] = "Erro ao atualizar os, verifique os erros."
            render :action => "edit"
        end
  end

  def edit
    @ProductImage = @Product.product_images.find(params[:id])
  end
  
  def update
    @ProductImage = @Product.product_images.find(params[:id])
    @ProductImage.attributes = params[:product_image]
  
    if @ProductImage.save
      redirect_to admin_product_product_images_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @ProductImage = @Product.product_images.find(params[:id])
    
    if @ProductImage.destroy
      redirect_to admin_product_product_images_path
    end
  end

  def load_product
    if session[:logged]
      true
    else
      redirect_to new_admin_session_path
    end
    
    @Product = Product.find(params[:product_id])    
  end
end
