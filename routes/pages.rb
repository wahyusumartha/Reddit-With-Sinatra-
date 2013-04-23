class Reddit < Sinatra::Application 
  
  # Show All Links Data
  get '/' do
    @links = Link.all :order => :id.desc 
    haml :index
  end

end
