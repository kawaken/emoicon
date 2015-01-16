class EmotionHistory
  include DataMapper::Resource

  property :id, Serial
  property :comment, String
  property :created_at, DateTime

  belongs_to :user
  belongs_to :emotion

  def self.register(emotion, user, comment)
    self.create(
      emotion: emotion,
      user: user,
      created_at: Time.now
    )
  end

  def self.today
    Emotion.default_items.map do |emotion|
      {
        emotion: emotion,
        history: self.all(:created_at.gte => Date.today, :emotion => emotion)
      }
    end
  end
end
