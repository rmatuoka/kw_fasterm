function show_session(x, obj)
{
	
	//MOTRA AS LOJAS
	if(jQuery("#box_cases" + x).hasClass('hide'))
	{
		//MOSTRA
		jQuery("#box_cases" + x).slideDown('slow');
		jQuery("#box_cases" + x).removeClass('hide')
	}
	else
	{
		//ESCONDE\
		jQuery("#box_cases" + x).slideUp('slow');
		jQuery("#box_cases" + x).addClass('hide')
	}
	//MUDA O FUNDO DO BACKGROUND
	if(jQuery(obj).hasClass("tit_case_mais"))
	{	
		//CLICADO
		//alert("fechar");
		jQuery(obj).removeClass('tit_case_mais');
		jQuery(obj).addClass('tit_case_menos')
	}
	else
	{
		//alert("abrir");
		jQuery(obj).removeClass('tit_case_menos');
		jQuery(obj).addClass('tit_case_mais')		
	}
	
	//alert(jQuery(obj).attr("class"));
}

function show_eventos(x, obj)
{
	
	//MOTRA AS LOJAS
	if(jQuery("#box_cases" + x).hasClass('hide'))
	{
		//MOSTRA
		jQuery("#box_cases" + x).slideDown('slow');
		jQuery("#box_cases" + x).removeClass('hide')
	}
	else
	{
		//ESCONDE\
		jQuery("#box_cases" + x).slideUp('slow');
		jQuery("#box_cases" + x).addClass('hide')
	}
	//MUDA O FUNDO DO BACKGROUND
	if(jQuery(obj).hasClass("tit_case_mais"))
	{	
		//CLICADO
		//alert("fechar");
		jQuery(obj).removeClass('tit_case_mais');
		jQuery(obj).addClass('tit_case_menos')
	}
	else
	{
		//alert("abrir");
		jQuery(obj).removeClass('tit_case_menos');
		jQuery(obj).addClass('tit_case_mais')		
	}
	
	//alert(jQuery(obj).attr("class"));
}