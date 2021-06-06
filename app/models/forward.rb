class Forward < ApplicationRecord
  belongs_to :user
  has_many :forward_hooks
end
