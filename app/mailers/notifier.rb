class Notifier < ActionMailer::Base
  default :from => "CONTATO FASTERM<site@fasterm.com.br>"
  
  def enviar(corpo)
      @Contato = corpo
      #mail(:to => "bsilva@korewa.com.br", :subject => "Fasterm - Contato via site")
      mail(:to => "contato@fasterm.com.br", :bbc => "site@fasterm.com.br", :subject => "Fasterm - Contato via site")
  end
end
