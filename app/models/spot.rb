class Spot < ActiveRecord::Base
  validates :lat, presence: true
  validates :long, presence: true
  validates_format_of :lat, with: /\A-?([1-8]?[1-9]|[1-9]0)\.{1}\d{1,8}\z/, on: create
  validates_format_of :long, with: /\A-?([1-8]?[1-9]|[1-9]0)\.{1}\d{1,8}\z/, on: create

  belongs_to :user

  mount_uploader :avatar, WaterPicUploader
end
