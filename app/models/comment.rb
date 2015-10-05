class Comment < ActiveRecord::Base

  ## Validation
  validates :content, presence: true

  ## Associations
  belongs_to :profile
  belongs_to :post

end
