class Notifier < ActionMailer::Base
    #se precisar os parametros são Email.deliver_padrao(corpo, "Assunto",email para&nbsp;&nbsp; #enviar(destino), email para resposta)
    def enviar(corpo, assunto, email = "site@fasterm.com.br",responder = "site@fasterm.com.br")
        recipients email
        from "site@fasterm.com.br"
        subject assunto
        reply_to responder
        body :corpo => corpo
    end

end
