class HorseApp < Sinatra::Base
  # set :method_override, true

  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  get '/horses/new' do
    erb :"horses/new"
  end

  post '/horses' do
    horse = Horse.new(params[:horse])
    horse.save
    redirect '/horses'
  end

  get '/horses/:id' do
    @horse = Horse.find_by_id(params[:id])
    erb :"horses/show"
  end


  get '/horses/:id/edit' do
    @horse = Horse.find(params[:id])
    erb :"horses/edit"
  end

  put '/horses/:id' do
    Horse.update(params[:id].to_i, params[:horse])
    redirect "/horses"
  end

  delete '/horses/:id' do
    Horse.destroy(params[:id].to_i)
    redirect "/horses"
  end

  get '/jockeys/:id' do
    @jockey = Jockey.find(params[:id])
    erb :"jockeys/show"
  end

end
