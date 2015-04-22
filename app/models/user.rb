class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_secure_password
  has_many :spots

  mount_uploader :avatar, AvatarUploader

  def self.find_or_create_by_auth(data)
    user = User.find_or_create_by(username: data.info.nickname )
    if user
      user.avatar     = data.info.image
      user.token      = data.credentials.token
      user.provider   = data.provider
      user.uid        = data.uid
      user.save
      return user
    end
  end
end
