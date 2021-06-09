class Forward < ApplicationRecord
  belongs_to :user
  has_many :forward_hooks, dependent: :destroy

  validates_uniqueness_of :url_token
  validates_uniqueness_of :local_url, scope: :user_id

  before_save :change_active_forwards

  def serial_hash
    ForwardSerializer.new(self).serializable_hash
  end

  def change_active_forwards
    user.forwards.where(active: true).update_all(active: false)
  end
end
