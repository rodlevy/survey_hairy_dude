$(document).ready(function() {
	$("a#login-hook").on('click', function(event){
		event.preventDefault();
		var url = $(this).attr('href');
		console.log(url);
		$.get(url, function(url_response){
			console.log(url_response);
			$('.container').hide();
			$('#login-hook').closest('div').append(url_response);
		});

	});
	
	$('#nav').on('submit','#login-layout', function(event){
		event.preventDefault();
		var data = $(this).serialize();	
		var url = $(this).attr('action');
		console.log(data);
		$.post(url, data, function(body){
			var new_nav = $(body).find('#nav').html();
			console.log(new_nav)
			$('#login-layout').hide();
			$('#nav').html(new_nav);
			$('.container').show();
		});
	});


