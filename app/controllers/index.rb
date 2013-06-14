get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do 
  if !current_user
    redirect to '/'
  else
    erb :test_jordan
  end
end

post '/create' do
  # survey = Survey.create(:name => params[:survey_name],
  #                         :user_id => current_user.id)
  # question = Question.create(:survey_id => survey.id, 
  #                 :content => params[:question]
  #                 )
  # Answer.create(:content => params[:answer],
  #               :question_id => question.id)
p params
  redirect to '/'
end
