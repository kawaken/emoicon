require 'omniauth-google-oauth2'

class GoogleAuthor
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    session = env['rack.session']

    if request.path =~ %r{^/auth/google_oauth2/callback} and env['omniauth.auth']
      session['emotion.user'] = {
        :name => env['omniauth.auth'][:info][:name],
        :email => env['omniauth.auth'][:info][:email]
      }
      return [302, {'Location' => '/'}, []]
    end

    @app.call(env)
  end

end
