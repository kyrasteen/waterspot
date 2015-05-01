class CurrentUser
  attr_reader :user

  def initialize(user)
    @user = user || Guest.new
  end

  def nav
   user.nil? || "layouts/user_nav_bar"
  end

  def username
    user.username
  end

  def id
    user.id
  end

  def avatar
    user.avatar
  end

  def email
    user.email
  end

  def spots
    user.spots
  end

  def polygons
    user.polygons
  end

end
