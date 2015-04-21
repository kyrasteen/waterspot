class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true

  mount_uploader :avatar, AvatarUploader

  def self.find_or_create_by_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.username   = data.info.username
    user.email      = data.info.email
    user.avatar     = data.info.image
    user.token      = data.credentials.token
    user.save
    return user
  end
end
