class Comment < ActiveRecord::Base
  acts_as_paranoid

  ## Validation
  validates :content, presence: true

  ## Associations
  belongs_to :profile
  belongs_to :post

end
