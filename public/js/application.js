// $(document).ready(function() {
// 	$("a#login-hook").on('click', function(event){
// 		event.preventDefault();
// 		var url = $(this).attr('href');
// 		console.log(url);
// 		$.get(url, function(url_response){
// 			console.log(url_response);
// 			$('.container').hide();
// 			$('#login-hook').closest('div').append(url_response);
// 		});

// 	});
	
// 	$('#nav').on('submit','#login-layout', function(event){
// 		event.preventDefault();
// 		var data = $(this).serialize();	
// 		var url = $(this).attr('action');
// 		console.log(data);
// 		$.post(url, data, function(body){
// 			var new_nav = $(body).find('#nav').html();
// 			console.log(new_nav)
// 			$('#login-layout').hide();
// 			$('#nav').html(new_nav);
// 			$('.container').show();
// 		});
// 	});

$(document).ready(function(){
		var result =[]
		$('.add-question').click(function(){
			$('.question-shell').append("<div class='question-container'><input type='text' class='question' placeholder='question'><div class='answer-shell'><div class='answer-container'><input type='text' class='answer' placeholder='answer'></div></div><button class='add-answer'>Add Answer</button></div>")
		})
		$('.add-answer').on('click', )
});
