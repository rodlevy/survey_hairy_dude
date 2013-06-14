get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do 
  if !current_user
    redirect to '/'
  else
    erb :create
  end
end

post '/create' do
  #to test when form is ready
  p params
  survey = Survey.create(:name => params[:survey_name],
                          :user_id => current_user.id)
  results.each do |result|
    question = Question.create(content: result[:question],
                               survey_id: survey.id)
    results[:answers].each do |answer|
      Answer.create(content: answer, question_id: question.id)
    end
  end

  redirect to '/'
end

get '/history' do
  if @user = current_user
    erb :history
  else
    redirect '/'
  end
end

get '/take/:survey_id' do
  if @survey = Survey.find(params[:survey_id])
    erb :take
  else
    redirect '/'
  end
end

post '/take/:survey_id' do
  
end
