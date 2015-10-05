class Post < ActiveRecord::Base

  ## Validation
  validates :title, presence: true

  ## Associations
  belongs_to :profile
  has_and_belongs_to_many :profiles
  has_many :comments

end
