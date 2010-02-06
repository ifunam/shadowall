class Nic
  include DataMapper::Resource
  property :id, Serial, :key => true
  property :mac_address, String, :key => true, :required => true
  property :enabled, Boolean, :required => true, :default => true
  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now

  validates_is_unique :mac_address

  has n, :hosts
end