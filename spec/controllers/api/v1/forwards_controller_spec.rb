require 'rails_helper'

RSpec.describe Api::V1::ForwardsController, type: :controller do
  let(:id) { SecureRandom.uuid }

  # === Routes (REST) ===
  describe 'Routes' do
    it { expect(get: '/forwards').to route_to({ controller: 'api/v1/forwards', action: 'index' }) }
    it { expect(post: '/forwards/add').to route_to({ controller: 'api/v1/forwards', action: 'add' }) }
    it { expect(post: "/forwards/#{id}/direct").to route_to({ controller: 'api/v1/forwards', action: 'direct', id: id }) }
    it { expect(get: "/forwards/#{id}/direct").to route_to({ controller: 'api/v1/forwards', action: 'direct', id: id }) }
  end

  # === Callbacks (Before) ===
  describe 'Callbacks' do
    it { is_expected.to use_before_action(:authenticate_user) }
    it { is_expected.to use_before_action(:find_forward) }
  end

  # === Instance Methods ===
  # Work in progress
end
