module Database
  include Config
   def connect
     DataMapper.setup(:default, Database.path)
   end
   
   def path
     "sqlite3://#{Dir.pwd}/db/#{Config.database['name']}"
   end
end
include Database