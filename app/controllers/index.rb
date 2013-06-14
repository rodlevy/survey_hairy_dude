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
  survey = Survey.create(:name => params[:title],
                          :user_id => current_user.id)

# {"question"=>"1", "answers"=>["a", "b"]}

  params[:results].values.each do |v|
    question = Question.create(content: v["question"],
                               survey_id: survey.id)

    v["answers"].each do |answer|
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
