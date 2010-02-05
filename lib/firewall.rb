module Firewall
  def enable_connection!
    Host.create(:user_id => current_user.id, :ip_address => request.ip)
    system "sudo pfctl -t goodguys -T add #{request.ip}/32"
  end
  
  def disable_connection(ip_address)
    system "sudo pfctl -t goodguys -T remove #{ip_address}/32"
  end
end