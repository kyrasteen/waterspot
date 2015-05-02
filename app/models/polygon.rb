class Polygon < ActiveRecord::Base
  validates :shape, presence: true, allow_blank: false

  belongs_to :user

  # def expire_outdated
  #   all.delete_if
  # end
end
