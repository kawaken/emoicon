require 'sinatra/base'
require 'erubis'

require_relative 'models/init'

class Nicorp < Sinatra::Base
  before do
    @user = User.find_or_create(session['emotion.user'])
  end

  get '/' do
    @emotions = Emotion.default_items
    @today_history = EmotionHistory.today
    erb :index
  end

  get '/history' do
    @histories = EmotionHistory.all(:created_at.gte => Date.today, :order => :created_at.desc)
    erb :history
  end

  post '/history' do
    emotion = Emotion.first(id: params[:emotion_id])
    EmotionHistory.register(emotion, @user, emotion.title)
    redirect to('/history')
  end

  get '/signin' do
    redirect to('/auth/google_oauth2')
  end

  get '/signout' do
    session.delete('emotion.user')
    redirect to('/')
  end
end
