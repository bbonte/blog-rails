class Profile < ActiveRecord::Base
  acts_as_paranoid

  ## CarrierWave avatar uploader
  mount_uploader :avatar, AvatarUploader

  ## Validation
  validates :name, presence: true

  ## Associations
  belongs_to :user
  has_many :posts, :dependent => :destroy
  has_and_belongs_to_many :likes, join_table: :posts_profiles, class_name: "Post"
  has_many :comments, :dependent => :destroy

  accepts_nested_attributes_for :user

end
