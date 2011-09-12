function show_eventos(x, obj)
{
	//MOTRA AS LOJAS
	if(jQuery("#eventos_body" + x).hasClass('hide'))
	{
		//MOSTRA
		jQuery("#eventos_body" + x).slideDown('slow');
		jQuery("#eventos_body" + x).removeClass('hide')
	}
	else
	{
		//ESCONDE\
		jQuery("#eventos_body" + x).slideUp('slow');
		jQuery("#eventos_body" + x).addClass('hide')
	}
	//MUDA O FUNDO DO BACKGROUND
	if(jQuery(obj).hasClass("evt_mais"))
	{	
		//CLICADO
		//alert("fechar");
		jQuery(obj).removeClass('evt_mais');
		jQuery(obj).addClass('evt_menos')
	}
	else
	{
		//alert("abrir");
		jQuery(obj).removeClass('evt_menos');
		jQuery(obj).addClass('evt_mais')		
	}
	
	//alert(jQuery(obj).attr("class"));
}