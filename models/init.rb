require 'dm-core'
DataMapper.setup(:default, 'sqlite3:db/sqlite3.db')

require_relative 'emotion'
require_relative 'emotion_history'
require_relative 'user'

DataMapper.finalize

def setup
  require 'dm-migrations'
  DataMapper.auto_migrate!

  Emotion.create(
    title: 'Good!!!',
    emoji_alias: 'laughing'
  )
  Emotion.create(
    title: 'ふつー',
    emoji_alias: 'neutral_face'
  )
  Emotion.create(
    title: '調子わる…',
    emoji_alias: 'astonished'
  )
end

if __FILE__ == $0
  setup
end
