require 'settingslogic'

class Settings < Settingslogic
  source "#{$APP_ROOT_PATH}/config/emoicon.yml"
  namespace ENV['APP_ENV'] || 'production'
  load!
end
