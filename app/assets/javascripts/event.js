$(function() {
	$(".notice").fadeOut(1500, "linear")
	$(".alert").fadeOut(1500, "linear")
	$(".error").fadeOut(1500, "linear")
	$(".success").fadeOut(1500, "linear")
	$(".info").fadeOut(1500, "linear")
	
	var cpt_genres=2;
	var cpt_auteurs=2;

	$(document).on('nested:fieldAdded:genres', function(event){
		// this field was just inserted into your form
		var field = event.field; 
		// it's a jQuery object already! Now you can find date input
		var labelField = field.find('label');
		// and activate datepicker on it
		labelField.html("Nom Genre "+cpt_genres+" :");
		cpt_genres++;
	})

	$(document).on('nested:fieldAdded:auteurs', function(event){
		// this field was just inserted into your form
		var field = event.field; 
		// it's a jQuery object already! Now you can find date input
		var labelFieldprenom = field.find(".prenom_auteur label");
		// and activate datepicker on it
		labelFieldprenom.html("Prénom Auteur "+cpt_auteurs+" :");
		var labelFieldnom = field.find(".nom_auteur label");
		// and activate datepicker on it
		labelFieldnom.html("Nom Auteur "+cpt_auteurs+" :");
		cpt_auteurs++;
	})

})

function slideonlyone(thechosenone) {
     $("div[name='search_form']").each(function(index) {
          if ($(this).attr("id") == thechosenone) {
               $(this).slideDown(200);
          }
          else {
               $(this).slideUp(600);
          }
     });
}