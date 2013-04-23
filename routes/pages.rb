class Reddit < Sinatra::Application 
  get '/' do
    haml :index 
  end
end
