$APP_ROOT_PATH = File.expand_path(File.dirname(__FILE__))

require './app'

require 'omniauth'

require './lib/settings'
require './lib/google_author'

use Rack::Session::Cookie, secret: Settings.session_secret
use OmniAuth::Builder do
  provider :google_oauth2, Settings.google.client_id, Settings.google.client_secret, \
    {scope: 'userinfo.email,userinfo.profile'}
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

use GoogleAuthor

run Nicorp
