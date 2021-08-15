module Api
  class BaseController < ActionController::API
    def encode_token(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decoded_payload(payload)
      JWT.decode(
        payload,
        Rails.application.secrets.secret_key_base,
        true,
        algorithm: 'HS256'
      )
    end

    def auth_header
      request.headers['HTTP_AUTHORIZATION']
    end

    def decoded_token
      if auth_header
        begin
          decoded_payload(auth_header)
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def logged_in_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end

    def logged_in?
      !!logged_in_user
    end

    def authenticate_user
      render json: { message: 'Please provide api key in header as AUTHORIZATION' }, status: :unauthorized unless logged_in?
    end

    def current_user
      @user
    end
  end
end
