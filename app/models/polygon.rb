class Polygon < ActiveRecord::Base
  validates :shape, presence: true, allow_blank: false

  belongs_to :user

   def self.expire_outdated
     where(["created_at < ?", Date.today - 30]).delete_all
   end
end
