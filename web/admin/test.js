
// Name can't be blank
$('#contact_name').on('input', function() {
	var input=$(this);
	var is_name=input.val();
	if(is_name){input.removeClass("invalid").addClass("valid");}
	else{input.removeClass("valid").addClass("invalid");}
});
// Email must be an email
$('#contact_email').on('input', function() {
	var input=$(this);
	var re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	var is_email=re.test(input.val());
	if(is_email){input.removeClass("invalid").addClass("valid");}
	else{input.removeClass("valid").addClass("invalid");}
});


$("#contact_submit button").click(function(event){
}); 
// After Form Submitted Validation
$("#contact_submit button").click(function(event){
	var form_data=$("#contact").serializeArray();
	var error_free=true;
	for (var input in form_data){
		var element=$("#contact_"+form_data[input]['name']);
		var valid=element.hasClass("valid");
		var error_element=$("span", element.parent());
		if (!valid){error_element.removeClass("error").addClass("error_show"); error_free=false;}
		else{error_element.removeClass("error_show").addClass("error");}
	}
	if (!error_free){
		event.preventDefault(); 
	}
	else{
		alert('No errors: Form will be submitted');
	}
});


}