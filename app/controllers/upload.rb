get '/photo_upload' do
  erb :photo_uploader
end

post '/photo_upload' do

  survey = Survey.find_by_id(params[:survey])
  survey.file = params[:photo]
  survey.save

  redirect to '/'

end

get '/view_photos' do
	@survey = Survey.find(1)
	erb :view_photos

end