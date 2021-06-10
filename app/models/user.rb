class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  has_many :forwards, dependent: :destroy
  has_many :forward_hooks, dependent: :destroy

  def serial_hash
    UserSerializer.new(self).serializable_hash
  end

  def active_forward
    forwards.where(active: true).order(created_at: :desc).first
  end
end
