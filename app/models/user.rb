class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :spots

  mount_uploader :avatar, AvatarUploader

  def self.find_by_auth(data)
    user = User.find_by(provider: data.provider, uid: data.uid)
    if user
      user.username   = data.info.nickname
      user.avatar     = data.info.image
      user.token      = data.credentials.token
      user.save
      return user
    end
  end
end
