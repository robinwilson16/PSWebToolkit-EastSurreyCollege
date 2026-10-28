(function($){
	$(document).ready(function(){
		$('span.menu-open').on('click', function(){
			var list = $(this).attr('data-toggle').split(/\s+/);
			if ($('#'+list[1]).length) {
				$('#'+list[1]).toggleClass("open");
			}
			$(this).toggleClass("change-icon");
		});
	});
})(jQuery)