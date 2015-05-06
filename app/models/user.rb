class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :spots, dependent: :destroy
  has_many :polygons

  mount_uploader :avatar, AvatarUploader

  def self.find_or_create_by_auth(data)
    # This doesn't look like it does any creating by
    # It's more like update_user_from_auth
    #
    user = User.find_by(username: data.info.nickname )
    if user
      user.avatar     = data.info.image
      user.token      = data.credentials.token
      user.provider   = data.provider
      user.uid        = data.uid
      user.save
      # if you want to be fancy, you can do
      # user.tap {|u| u.save}
      return user
    end
  end

  private

  # coordinates_valid?
  # Is there a reason you're passing them in instead of just setting them on the
  # model before checking them?
  # Also it's not clear to me what this is doing. It's private but I don't see
  # it getting called anywhere?
  #
  def invalid_coordinates(attributes)
    attributes['lat'] =~ /\A(\-?\d+(\.\d+)?)\z/
    attributes['long'] =~ /\A(\-?\d+(\.\d+)?)\z/
  end
end
