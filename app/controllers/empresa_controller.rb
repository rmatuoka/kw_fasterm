class EmpresaController < ApplicationController
  before_filter :navegadorie6
  def index
    @DynamicPage = DynamicPage.first(:conditions => ['id = 1 AND published = 1'])    
    @Erro = false
    if @DynamicPage.blank?
      @DynamicPage = '<br /><br /><p style="text-align: center;"><strong>Ocorreu um erro!</strong><br /> <br />Se o problema persistir, por favor entre em contato com o suporte técnico!</p>'
      @Erro = true
    end
  end

end
