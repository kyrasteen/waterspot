class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password
  has_many :spots

  mount_uploader :avatar, AvatarUploader

  def self.find_or_create_by_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)
    user.username   = data.info.nickname
    user.avatar     = data.info.image
    user.token      = data.credentials.token
    user.email      = "default@example.com"
    user.password   = "password"
    user.save
    return user
  end
end
