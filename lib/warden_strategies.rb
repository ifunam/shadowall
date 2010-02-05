module Warden
  module Strategies
    class DataBase < Warden::Strategies::Base
      def valid?
        params["login"] || params["password"]
      end

      def authenticate!
        u = User.authenticate(params["login"], params["password"])
        u.nil? ? fail!("Could not log in") : success!(u)
      end

      def authorizate!
        u = User.authenticate(params["login"], params["password"])
        !u.status? ? fail!("Could not authorize your accces attempt") : success!(u)
      end
    end
  end
end