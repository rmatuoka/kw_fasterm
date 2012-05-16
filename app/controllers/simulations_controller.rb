class SimulationsController < ApplicationController
  def index
    
  end
  
  def create
    #VARIAVEIS
    @LITROS_HOTEL = 60
    @LITROS_MOTEL = 80
    @LITROS_HOSPITAL = 80
    @LITROS_ACADEMIA = 80
    @LITROS_CONDOMINIO = 80
    
    @GRAU_DE_AQUECIMENTO = 35
    @KCAL_FT = 22000.00
    @KCAL_FT_UN = 7700
    @KCAL_GLP_UN = 2.8
    @KCAL_DIESEL_UN = 3
    @KCAL_GN_UN = 3
    @KCAL_ENERGIA_UN = 20000
    
    
    @CUSTO_FT = 0.00
    @CUSTO_GLP = 0.00
    @CUSTO_DIESEL = 0.00
    @CUSTO_ENERGIA = 0.00
    @CUSTO_GN = 0.00
    
    #CO2
    @CO2_BASE_DIESEL = 3.11
    @CO2_BASE_GLP = 2.91
    @CO2_BASE_GN = 2.91
    
    @TOTAL_KG_CO2 = 0.00
    
    @TOTAL_CO2_ANUAL = 0.0
    @TOTAL_CO2_MES = 0.0
    
    #FONTES DE ENERGIA
    @E_GLP = 2.50
    @E_DIESEL = 2.10
    
    if !params[:valor_energia_e].blank?
      @E_ENERGIA = params[:valor_energia_e].to_f
    else
      @E_ENERGIA = 0.42
    end
    
    puts "AAA" + @E_ENERGIA.to_s
    @E_GN = 2.3
    @E_USUARIO = 0
    
    @Economia = 0.00
    total_litros = 0
    horas_de_funcionamento = 0
    kcal_necessarias = 0
    
    #TRATA CUSTO
    params[:valor_energia] = params[:valor_energia].gsub(",",".")
    
    #VERIFICA TIPO DE EMPREENDIMENTO
    case params[:empreendimento]
    when "1"
      puts "=> HOTEL"
      
      total_litros = ((params[:n_apartamentos_hotel]).to_i * (params[:n_leitos_hotel]).to_i * @LITROS_HOTEL * (params[:taxa_ocupacao_hotel].to_f / 100).to_f).to_i
      
      puts "==> TOTAL DE LITROS " + total_litros.to_s

    when "2"
      puts "MOTEL"
      
      total_litros = ((params[:n_apartamentos_motel]).to_i * (params[:rotatividade_motel]).to_i * @LITROS_MOTEL).to_i
      
      puts "==> TOTAL DE LITROS " + total_litros.to_s
      
    when "3"
      puts "HOSPITAL"
      
      total_litros = ((params[:n_banhos_hospital]).to_i * @LITROS_HOSPITAL).to_i
      
      puts "==> TOTAL DE LITROS " + total_litros.to_s
      
    when "4"
      puts "ACADEMIA"
      
      total_litros = ((params[:n_banhos_academia]).to_i * @LITROS_ACADEMIA).to_i
      
      puts "==> TOTAL DE LITROS " + total_litros.to_s
      
    when "5"
      puts "=> CONDOMINIO"
      
      total_litros = ((params[:n_apartamentos_cond]).to_i * (params[:n_leitos_cond]).to_i * @LITROS_HOTEL * (100).to_f).to_i
      
      puts "==> TOTAL DE LITROS " + total_litros.to_s
    
    end
    
    #CALCULA O CUSTO FT
    @CUSTO_FT = calcula_custo_ft(calcula_horas_necessarias(total_litros))
    puts "CUSTO FT " +  @CUSTO_FT.to_s
  
    #CALCULA O CUSTO DE ENERGIA
    
    case params[:combustivel]
    when "1"
      puts "GLP"
      @CUSTO_GLP = calcula_custo(calcula_horas_necessarias(total_litros), "glp")
      puts "CUSTO GLP " + @CUSTO_GLP.to_s 
      #CALCULA CO2
      if params[:valor_energia].blank?
        @TOTAL_KG_CO2 = (@CUSTO_GLP / @E_GLP).to_f
      else
        @TOTAL_KG_CO2 = (@CUSTO_GLP / params[:valor_energia].to_f).to_f
      end
      #CO2
      @TOTAL_CO2_ANUAL = (@TOTAL_KG_CO2 * @CO2_BASE_GLP * 12)/1000
      @TOTAL_CO2_MES = (@TOTAL_KG_CO2 * @CO2_BASE_GLP)/1000
      
      #RESULTADO
      @Economia = 100 - ((@CUSTO_FT / @CUSTO_GLP) * 100).round(2)
    when "2"
      puts "DIESEL"
      @CUSTO_DIESEL = calcula_custo(calcula_horas_necessarias(total_litros), "diesel")
      puts "CUSTO DIESEL " + @CUSTO_DIESEL.to_s
      #CALCULA CO2
      if params[:valor_energia].blank?
        @TOTAL_KG_CO2 = (@CUSTO_GLP / @E_DIESEL).to_f
      else
        @TOTAL_KG_CO2 = (@CUSTO_GLP / params[:valor_energia].to_f).to_f
      end
      #CO2
      @TOTAL_CO2_ANUAL = (@TOTAL_KG_CO2 * @CO2_BASE_DIESEL * 12)/1000
      @TOTAL_CO2_MES = (@TOTAL_KG_CO2 * @CO2_BASE_DIESEL)/1000
      
      #RESULTADO
      @Economia = 100 - ((@CUSTO_FT / @CUSTO_DIESEL) * 100).round(2)
    when "3"
      puts "ENERGIA"
      @CUSTO_ENERGIA = calcula_custo(calcula_horas_necessarias(total_litros), "energia")
      puts "CUSTO ENERGIA " + @CUSTO_ENERGIA.to_s
      @Economia = 100 - ((@CUSTO_FT / @CUSTO_ENERGIA) * 100).round(2)
      
    when "4"
      puts "GN"
      @CUSTO_GN = calcula_custo(calcula_horas_necessarias(total_litros), "gn")
      puts "CUSTO GN " + @CUSTO_GN.to_s
      #CALCULA CO2
      if params[:valor_energia].blank?
        @TOTAL_KG_CO2 = (@CUSTO_GLP / @E_GN).to_f
      else
        @TOTAL_KG_CO2 = (@CUSTO_GLP / params[:valor_energia].to_f).to_f
      end
      #CO2
      @TOTAL_CO2_ANUAL = (@TOTAL_KG_CO2 * @CO2_BASE_GN * 12)/1000
      @TOTAL_CO2_MES = (@TOTAL_KG_CO2 * @CO2_BASE_GN)/1000
      
      #RESULTADO
      @Economia = 100 - ((@CUSTO_FT / @CUSTO_GN) * 100).round(2)
    end
    
    @Economia = 0 if @Economia < 0
    #RETORNA A % DE ECONOMIA
    puts "% DE ECONOMIA => " + @Economia.to_s
    
    puts "CO2 ANO => " + @TOTAL_CO2_ANUAL.to_s
    puts "CO2 MES => " + @TOTAL_CO2_MES.to_s
  end
  
  def calcula_custo_ft(horas_de_funcionamento)
    puts "BBB" + @E_ENERGIA.to_s
    return ((((horas_de_funcionamento * @KCAL_FT_UN) / 100) * @E_ENERGIA) / 10) * 30
    
  end
  
  def calcula_custo(horas_de_funcionamento, tipo_de_energia)
    custo = 0
    
    case tipo_de_energia 
      when "glp"
        if params[:valor_energia].blank?
          custo = ((horas_de_funcionamento * @KCAL_GLP_UN).to_f * @E_GLP) * 30
          
        else
          custo = ((horas_de_funcionamento * @KCAL_GLP_UN).to_f * params[:valor_energia].to_f) * 30
        end
      when "diesel"
        if params[:valor_energia].blank?
          custo = ((horas_de_funcionamento * @KCAL_DIESEL_UN).to_f * @E_DIESEL) * 30
        else
          custo = ((horas_de_funcionamento * @KCAL_DIESEL_UN).to_f * params[:valor_energia].to_f) * 30
        end
      when "gn"
        if params[:valor_energia].blank?
          custo = ((horas_de_funcionamento * @KCAL_GN_UN).to_f * @E_GN) * 30
        else
          custo = ((horas_de_funcionamento * @KCAL_GN_UN).to_f * params[:valor_energia].to_f) * 30
        end
      when "energia"
        if params[:valor_energia].blank?
          custo = (((horas_de_funcionamento * @KCAL_ENERGIA_UN).to_f * @E_ENERGIA) / 1000) * 30
        else
          custo = (((horas_de_funcionamento * @KCAL_ENERGIA_UN).to_f * params[:valor_energia].to_f) / 1000) * 30
        end
    end

    return custo
  end
  
  def calcula_horas_necessarias(total_litros)
    horas_de_funcionamento = 0
    kcal_necessarias = 0
    
    kcal_necessarias = (total_litros * @GRAU_DE_AQUECIMENTO).to_i
    puts "===> KCAL NECESSARIAS " + kcal_necessarias.to_s
    
    horas_de_funcionamento = (kcal_necessarias / @KCAL_FT).to_f
    puts "====> HORAS " + horas_de_funcionamento.to_s
    
    return horas_de_funcionamento
  end

end
