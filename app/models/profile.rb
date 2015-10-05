class Profile < ActiveRecord::Base

  ## CarrierWave avatar uploader
  mount_uploader :avatar, AvatarUploader

  ## Validation
  validates :name, presence: true

  ## Associations
  belongs_to :user
  has_many :posts
  has_and_belongs_to_many :likes, join_table: :posts_profiles, class_name: "Post"
  has_many :comments

end
