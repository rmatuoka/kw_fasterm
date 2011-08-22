class Admin::TestimonialsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }
  
  def index
    @Testimonials = Testimonial.find(:all)
  end

  def show
    @Testimonial = Testimonial.find(params[:id])
  end
  
  def new
    @Testimonial = Testimonial.new
  end

  def create
    @Testimonial = Testimonial.create(params[:testimonial])
    
    if @Testimonial.save
      redirect_to admin_testimonials_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Testimonial = Testimonial.find(params[:id])
  end
  
  def update
    @Testimonial = Testimonial.find(params[:id])
    @Testimonial.attributes = params[:testimonial]
    
    if @Testimonial.save
      redirect_to admin_testimonials_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Testimonial = Testimonial.find(params[:id])
    
    if @Testimonial.destroy
      redirect_to admin_testimonials_path
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
