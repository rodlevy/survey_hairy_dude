get '/' do
  @top_surveys = Survey.order('created_at DESC').limit(6)
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

get '/results/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :results
end

get '/take/:survey_id' do
  if @survey = Survey.find(params[:survey_id])
    erb :take
  else
    redirect '/'
  end
end

get '/thanks' do
  erb :thanks
end

post '/take/:survey_id' do
  p params
  params.each_pair do |question_id, answer_id|
    if question_id.match(/\d/)
      Response.create(:user_id => current_user.id,
                          :question_id => question_id,
                          :answer_id  => answer_id)
    end
  end
  redirect '/thanks'
end

get '/charts' do
  erb :charts
end
