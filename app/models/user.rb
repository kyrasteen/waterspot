class User < ActiveRecord::Base
  validates :email, presence: true

  has_many :spots

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  def self.find_or_create_by_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.username   = data.info.nickname
    user.avatar     = data.info.image
    user.token      = data.credentials.token
    user.save
    return user
  end
end
