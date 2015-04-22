class Spot < ActiveRecord::Base
  validates :lat,  presence: true
  validates :long, presence: true
  validate  :lat,  :latitude_format
  validate  :long, :longitude_format

  belongs_to :user

  mount_uploader :avatar, WaterPicUploader

  private

  def latitude_format
   if !(lat.match(/\A\s*[-+]?\d{1,3}\.\d+\z/))
     errors.add(:lat, "incorrect format")
   end
  end

  def longitude_format
    if !(long.match(/\A?[-+]?\d{1,3}\.\d+\s*\z/))
     errors.add(:long, "incorrect format")
    end
  end

end
