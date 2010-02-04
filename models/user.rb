class User
  include DataMapper::Resource
  property :id, Serial, :key => true
  property :login, String, :key => true, :unique => true
  property :password, String
  property :status, Boolean, :default => false
  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime , :default => Time.now 
  has n, :hosts
end


