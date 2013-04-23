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

  # Vote Link 
  put '/:id/vote/:type' do
    l = Link.get params[:id]
    l.points += params[:type].to_i 
    l.save 
    redirect back
  end

  # Populate Data 
  get '/hot' do
    @links = Link.all_sorted_desc
    haml :index
  end

end
