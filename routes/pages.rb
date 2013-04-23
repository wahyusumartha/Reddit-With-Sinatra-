class Reddit < Sinatra::Application 
  
  # Show All Links Data
  get '/' do
    @links = Link.all :order => :id.desc 
    haml :index
  end

  # Insert New Link 
  post '/' do
    l = Link.new
    l.title = params[:title]
    l.url = params[:url]
    l.created_at = Time.now
    l.save
    redirect back
  end

end
