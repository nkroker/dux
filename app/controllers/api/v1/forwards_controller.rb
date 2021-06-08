module Api
  module V1
    class ForwardsController < Api::BaseController
      before_action :authenticate_user

      def add
        binding.pry
      end
    end
  end
end