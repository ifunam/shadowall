require "rubygems"
require "bundler"
Bundler.setup
Bundler.require(:default)
Dir['lib/*.rb'].each{|lib| require lib }
Dir['models/*.rb'].each{|lib| require lib}
Database.connect
