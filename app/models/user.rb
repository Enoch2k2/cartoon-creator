class User < ActiveRecord::Base
  has_many :cartoons

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password
end
