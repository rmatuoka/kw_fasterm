class NoticiasController < ApplicationController
  before_filter :navegadorie6
  def index
    @Noticias = Notice.all(:conditions => ['published = 1'], :order=>'created_at desc')
  end

  def show
    @Noticia = Notice.find(params[:id])
    #SELECIONA IMAGENS
    @Imagens = @Noticia.notice_images.all
  end

end
