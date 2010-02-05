require 'bcrypt'
class User
  include BCrypt
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :login, String, :key => true, :unique => true, :length => (3..40), :required => false
  property :encrypted_password, String, :length => 60, :lazy => false
  property :status, Boolean, :default => false
  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime , :default => Time.now 

  validates_present :login, :encrypted_password
  validates_is_unique :login

  has n, :hosts

  def password=(password)
    self.encrypted_password = BCrypt::Password.create(password).to_s
  end

  def self.authenticate(login, password)
    u = User.first(:login => login)
    if !u.nil? and u.status? and BCrypt::Password.new(u.encrypted_password) == password
       u.encrypted_password = nil
       u
    end
  end
end
