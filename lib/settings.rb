require 'settingslogic'

class Settings < Settingslogic
  source "#{$APP_ROOT_PATH}/config/nicorp.yml"
  namespace ENV['APP_ENV'] || 'production'
  load!
end
