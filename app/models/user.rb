class User < ActiveRecord::Base
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## before_create :build_profile TODO: delete?

  ## Associations
  has_one :profile, :dependent => :destroy

  ## accepts_nested_attributes_for :profile ## TODO: delete?

end
