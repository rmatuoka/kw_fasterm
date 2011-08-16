jQuery(document).ready(function () {
	jQuery('div.itens_cases').hide();
    jQuery('a.tit_case_menos').click(function () {
	jQuery('div.itens_cases').slideToggle('medium');
    });
});