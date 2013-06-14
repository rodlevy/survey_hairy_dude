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
		var result =[];
		$('.add-question').click(function(){
			$('.question-shell').append("<div class='question-container'><input type='text' class='question' placeholder='question'><div class='answer-shell'><div class='answer-container'><input type='text' class='answer' placeholder='answer'></div></div><button class='add-answer'>Add Answer</button></div>")
		});
		$('.question-shell').on('click', '.add-answer', function(){
			$(this).before("<input type='text' class='answer' placeholder='answer'><br>");
		} );
		$('.submit').on('click', function(){
			$('.question-container').each(function(){
				var current_question = {};
				var current_answers = [];
				current_question['question'] = $(this).find('.question').val();
				$(this).find('.answer').each(function(){
					current_answers.push($(this).val());
				});
				current_question['answers'] = current_answers;
				result.push(current_question);
			})
			title = $('.survey-title').val();
			$.post('/create',{results: result, title: title})
		})
	

});
