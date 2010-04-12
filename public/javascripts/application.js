// application_jquery.js
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
	showHideBasedOnValue('#dataset_geo_granularity_id', '#f_geoGranularityOther', 16);
	showHideBasedOnValue('#dataset_geo_granularity_id', '#f_geoGranularityPoint', 15);
});


function showHideBasedOnValue(f_parent, f_child, f_value) {
	cookieName = "fieldcookie_"+f_child;
	$(f_child).css("display","none");
		$(f_parent).click(function(){
  	      	if ($(f_parent).val() == f_value) {
		       	  	$(f_child).slideDown("fast");
		            $.cookie(cookieName, 'expanded'); //Add cookie
		        } else {
		            $(f_child).slideUp("fast");
		            $.cookie(cookieName, 'collapsed'); //Add cookie
		    }
     	});
        var showItem = $.cookie(cookieName);
        if (showItem == 'expanded') {
      	$(f_child).show("fast");
      } else {
      	$(f_child).hide("fast");
      }
}