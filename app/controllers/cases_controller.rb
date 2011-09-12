class CasesController < ApplicationController
  before_filter :navegadorie6
  def index
    @Cases = Case.all(:conditions => ['published = 1'], :order => "`cases`.`category`")
  end

  def categoria
  end

  def show
    @Case = Case.find(params[:id])
    #SELECIONA IMAGENS
    @Imagens = @Case.case_images.all
  end

end
