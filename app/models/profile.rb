class Profile < ActiveRecord::Base

  validates :name, :email, presence: true

  has_many :posts

end
