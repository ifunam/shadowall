require 'environment'
class Setup < Thor
   include Thor::Actions

   desc "install_gems", "Install gem dependencies using the ruby Bundler"
   def install_gems 
     run "gem bundle"
   end

   desc "createdb", "Create database"
   def createdb
     run "mkdir db" unless File.exist? 'db'
     DataMapper.auto_migrate! 
   end
   
   desc "dropdb", "Drop database"
   def dropdb
      run "rm #{Database.path}"
   end
   
   desc "migratedb", "Migrate database"
   def migratedb
      DataMapper.auto_migrate!
   end
end
