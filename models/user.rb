require 'gravatar'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :gravatar_url, String

  def self.new_user(name, email)
    url = Gravatar.new(email).image_url
    self.create(
      name: name,
      email: email,
      gravatar_url: url,
    )
  end

  def self.find_or_create(h)

    unless h
      return nil
    end

    name = h[:name]
    email = h[:email]

    unless name && email
      return nil
    end

    user = self.first(email: email)
    if not user
      user = self.new_user(name, email)
    end

    user
  end
end
