module Warden
  module Strategies
    class DataBase < Warden::Strategies::Base

      def valid?
        params["login"] || params["password"]
      end

      def authenticate!
        u = User.authenticate(params["login"], params["password"])
        unless u.nil?
          success!(u)
        else
          fail!("Could not log in")
        end
        u.nil? ? fail!("Could not log in") : success!(u)
      end

      def authorizate!
        u = User.authenticate(params["login"], params["password"])
        unless u.is_locked?
          success!(u)
        else
          fail!("Could not authorize your accces attempt")
        end
      end      
    end
  end
end