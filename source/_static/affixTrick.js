
addJsLibrary = function(url){
	var $body = $("body");
	//if ($body.find("script[src='"+url+"']").length==0)
	$body.append("<script src='"+url+"'></script>");
}

$(document).ready(function(){
	
    // Local TOC.
    $(".bs-sidenavNew ul").addClass("nav nav-list");
    $(".bs-sidenavNew > ul > li > a").addClass("nav-header");

//	setTimeout(function () {
		if ($(".section").first().outerHeight()>($("#sidebar").outerHeight()+60)){
			console.log("NEW affix");
			$jqTheme("#sidebar").affix({
				offset: {
					top: 149,
					bottom: function () {
						return (this.bottom = $('.footer').outerHeight(true))
					}
				}
			});

			setInterval(function(){
				$(".section").first().css("min-height", $("#sidebar").outerHeight()+25);
			}, 1000);
		} //else {
//			// disable affix
//			$jqTheme(window).off('.affix');
//			$jqTheme("#sidebar").removeData('affix').removeClass('affix affix-top affix-bottom');
//		}
//	}, 500);
});

