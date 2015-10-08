class Post < ActiveRecord::Base
  acts_as_paranoid

  ## CarrierWave avatar uploader
  mount_uploader :avatar, AvatarUploader

  ## Validation
  validates :title, presence: true

  ## Associations
  belongs_to :profile
  has_and_belongs_to_many :profiles, :dependent => :destroy ## LIKES
  has_many :comments, :dependent => :destroy

end
