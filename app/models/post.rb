class Post < ActiveRecord::Base

  ## CarrierWave avatar uploader
  mount_uploader :avatar, AvatarUploader

  ## Validation
  validates :title, presence: true

  ## Associations
  belongs_to :profile
  has_and_belongs_to_many :profiles
  has_many :comments, :dependent => :destroy

end
