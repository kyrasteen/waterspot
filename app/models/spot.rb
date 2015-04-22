class Spot < ActiveRecord::Base
  validates :lat,  presence: true
  validates :long, presence: true
  validates_numericality_of :lat
  validates_numericality_of :long

  belongs_to :user

  mount_uploader :avatar, WaterPicUploader

end
