class Spot < ActiveRecord::Base
  # validates :lat, presence: true, numericality: true
  # You can probably just do all the validations on :lat in one place so you
  # don't have duplication below
  validates :lat,  presence: true
  validates :long, presence: true
  validates :rating, presence: true
  validates_numericality_of :lat
  validates_numericality_of :long

  belongs_to :user

  mount_uploader :avatar, WaterPicUploader

  # This probably belongs in a presenter (I'd use Draper for this)
  def formatted_date
    created_at.strftime("%A, %b %d")
  end

end
