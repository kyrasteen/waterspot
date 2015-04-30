class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :spots, dependent: :destroy
  has_many :polygons

  mount_uploader :avatar, AvatarUploader

  def self.find_or_create_by_auth(data)
    user = User.find_by(username: data.info.nickname )
    if user
      user.avatar     = data.info.image
      user.token      = data.credentials.token
      user.provider   = data.provider
      user.uid        = data.uid
      user.save
      return user
    end
  end

  def send_area_watch_email(user, spot)
    UserAreaWatch.send_update_email(user, spot).deliver
  end

  private

  def invalid_coordinates(attributes)
    attributes['lat'] =~ /\A(\-?\d+(\.\d+)?)\z/
    attributes['long'] =~ /\A(\-?\d+(\.\d+)?)\z/
  end
end
