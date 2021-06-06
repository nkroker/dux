class User < ApplicationRecord
  has_many :forwards
  has_many :forward_hooks
end
