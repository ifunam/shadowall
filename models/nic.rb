class Nic
  include DataMapper::Resource
  property :id, Serial, :key => true
  property :mac_address, String, :key => true, :required => true
  property :is_blocked, Boolean, :required => true, :default => false
  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now
  has n, :hosts
end