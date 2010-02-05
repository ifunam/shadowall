class DhcpObserver
  include Config

  def self.file=(file)
    @@file = file 
  end
  
  def self.backward=(n)
    @backward = n
  end

  def self.file
    @@file ||= Config.dhcp('file')
  end

  def self.backward
    @@backward ||= Config.dhcp('backward').to_i
  end

  def self.tail
    File::Tail::Logfile.open(DhcpObserver.file, :backward => DhcpObserver.backward) do |log|
      log.tail { |l| yield  l }         
    end
  end

  def self.run
    attributes = {}
    DhcpObserver.tail do |log|
      attributes[:ip_address] = $1 if log =~ /lease (.*) \{/
      attributes[:mac_address] = $1 if log =~ /hardware ethernet (.*);/
      save_host(attributes) and attributes = {} if valid?(attributes)
    end
  end

  private
  def self.valid?(attributes)
    attributes.has_key? :ip_address and attributes.has_key? :mac_address
  end

  def self.save_host(h)
    nic = Nic.first_or_create :mac_address => h[:mac_address]
    Host.create(:ip_address => h[:ip_address], :nic_id => nic.id)
  end
end
