class Spot < ActiveRecord::Base
  validates :lat,  presence: true
  validates :long, presence: true
  validates :rating, presence: true
  validates_numericality_of :lat
  validates_numericality_of :long

  belongs_to :user

  mount_uploader :avatar, WaterPicUploader

  def formatted_date
    created_at.strftime("%A, %b %d")
  end

   def self.expire_outdated
     where(["created_at < ?", Date.today - 30]).delete_all
   end

end
