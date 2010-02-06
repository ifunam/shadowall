require File.dirname(__FILE__) + '/../environment'
class DhcpObserverDaemon < SimpleDaemon::Base
  SimpleDaemon::WORKING_DIRECTORY = File.dirname(__FILE__) + "/../log" 

  def self.start
    loop do  
      DhcpObserver.run
    end
  end

  def self.stop
    puts "Stopping Dhcp Observer " 
  end
end

DhcpObserverDaemon.daemonize
