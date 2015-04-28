class Polygon < ActiveRecord::Base
  validates :shape, presence: true, allow_blank: false

  belongs_to :user
end
