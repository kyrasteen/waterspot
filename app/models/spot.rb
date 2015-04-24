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

end
