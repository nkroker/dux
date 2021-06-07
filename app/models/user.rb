class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  has_many :forwards
  has_many :forward_hooks

  def serial_hash
    UserSerializer.new(self).serializable_hash
  end
end
