require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  # === Routes (REST) ===
  describe 'Routes' do
    it { expect(post: '/users').to route_to({ controller: 'api/users', action: 'create' }) }
    it { expect(post: '/login').to route_to({ controller: 'api/users', action: 'login' }) }
  end

  # === Instance Methods ===

  describe 'Instance Methods' do
    let(:resp_keys) { ['username', 'email', 'api_key', 'created_at'] }
    let(:params) {
        {
          email: 'fancy@example.com',
          username: 'fancy',
          password: 'superstrong007'
        }
      }

    describe '#create' do
      before do
        post :create, params: params
      end

      it 'creates a user account' do
        resp = JSON.parse(response.body)['data']['attributes']

        expect(response.status).to eq(200)
        expect(resp.keys).to eq(resp_keys)
      end
    end

    describe '#login' do
      let(:login_params) {
        params.merge(api_key:    SecureRandom.uuid)
      }

      before do
        User.create(login_params)
        post :login, params: login_params
      end

      it 'Logs in a user' do
        resp = JSON.parse(response.body)['data']['attributes']

        expect(response.status).to eq(200)
        expect(resp.keys).to eq(resp_keys)
      end
    end
  end
end
