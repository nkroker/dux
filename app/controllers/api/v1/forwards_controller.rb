module Api
  module V1
    class ForwardsController < Api::BaseController
      before_action :authenticate_user, except: [:direct]
      before_action :find_forward, only:[:direct]

      def index
        render json: current_user.forward_list
      end

      def add
        token = SecureRandom.uuid
        forward = current_user.forwards.create(
          global_url: "#{request.base_url+direct_forward_path(token)}",
          url_token: token,
          local_url: params[:url],
          active: true
        )

        render json: forward.serial_hash
      end

      def direct
        ForwardHook.create(
          head: extract_headers,
          body: params.to_s,
          user: current_user,
          forward: @forward
        )
        redirect_to(@forward.local_url)
      end

      private

      def extract_headers
        request.headers.to_h.first(27).to_h rescue ''
      end

      def find_forward
        @forward = Forward.find_by(url_token: params[:id]).user.active_forward
      end
    end
  end
end