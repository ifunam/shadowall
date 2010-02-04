require File.dirname(__FILE__) + '/vendor/gems/environment'
require 'extlib'
Bundler.require_env
Dir['lib/*.rb'].each{|lib| require lib }
Dir['models/*.rb'].each{|lib| require lib}
Database.connect
