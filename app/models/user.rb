class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :posts

  def self.twitter_auth auth
    credentials = { uid: auth[:uid], provider: :twitter }
    pwd = Devise.friendly_token[0,20]

    User.find_or_create_by(credentials) do |user|
      user.name = auth[:info][:name]
    end
  end

  def from_twitter?
    provider == 'twitter'
  end

  def email_required?
    return false if from_twitter?
    super
  end

  def password_required?
    return false if from_twitter?
    super
  end

  def update_with_password(params, *options)
    if from_twitter?
      update_attributes(params, *options)
    else
      super
    end
  end
end