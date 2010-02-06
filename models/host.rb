class Host
  include DataMapper::Resource
  property :id, Serial
  property :ip_address, IPAddress, :required => true
  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now
  belongs_to :user, :required => false
  belongs_to :nic, :required => false
end