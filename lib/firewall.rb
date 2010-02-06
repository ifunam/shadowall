module Firewall
  def enable_connection!
    Host.create(:user_id => current_user.id, :ip_address => request.ip)
    system "sudo pfctl -t goodguys -T add #{request.ip}/32"
  end

  def enable_nic_connection!
    host = Host.last(:ip_address => request.ip)
    host.update(:user_login => current_user.login)
    system "sudo pfctl -t goodguys -T add #{request.ip}/32" if host.nic.enabled?
  end
  
  def disable_connection(ip_address)
    system "sudo pfctl -t goodguys -T remove #{ip_address}/32"
  end
end