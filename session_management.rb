class SessionManagement < Sinatra::Default
  enable :static, :session, :methodoverride, :reload
  set :environment, :development
  set :app_file, __FILE__
#  set :port, 80

  use Rack::Session::Cookie
  use Rack::Flash

  use Warden::Manager do |manager|
    manager.failure_app = SessionManagement
    manager.serialize_into_session{|user| user.id }
    manager.serialize_from_session{|id| User.get(id) }
    manager.default_strategies :auth_db
    manager.strategies.add(:auth_db, Warden::Strategies::DataBase)
  end
    
  get '/stylesheets/base.css' do
    headers 'Content-Type' => 'text/css; charset=utf-8'
    sass :base
  end

  get "/" do
    _haml 'index'
  end

  get '/unauthenticated' do
    status 401
    flash[:warning] = 'Login or password is wrong.'
    _haml :index
  end

  post '/unauthenticated/?' do
    status 401
    flash[:warning] = 'Login or password is wrong.'
    _haml :index
  end

  post '/login/?' do
    env['warden'].authenticate!
    _haml :welcome
  end

  get '/logout' do
    env['warden'].logout
    redirect '/'
  end
end
