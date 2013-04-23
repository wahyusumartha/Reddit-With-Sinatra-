class Link 
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :required => true
  property :url, Text, :required => true
  property :score, Integer 
  property :points, Integer, :default => 0
  property :created_at, Time

  attr_accessor :score 

  def calculate_score 
    time_elapsed = (Time.now - self.created_at) / 3600 
    self.score = ((self.points-1) / (time_elapsed+2)**1.8).real
  end

  def self.all_sorted_desc 
    self.all.each { | item | item.calculate_score }.sort { |a,b| a.score <=> b.score }.reverse
  end

end

DataMapper.finalize.auto_upgrade!
