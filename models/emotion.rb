require 'gemoji'

class Emotion
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :emoji_alias, String

  def self.default_items
    self.all(order: [:id])
  end

  def emoji
    Emoji.find_by_alias(self.emoji_alias)
  end
end
