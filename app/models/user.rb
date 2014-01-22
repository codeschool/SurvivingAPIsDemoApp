class User < ActiveRecord::Base
  has_many :payments, dependent: :destroy
  validates :username, uniqueness: true

  has_secure_password
end

