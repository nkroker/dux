module Api
  class UsersController < Api::BaseController

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({ user_id: @user.id })
        @user.update(api_key: token)
        render json: @user.serial_hash
      else
        render json: { error: @user.errors.to_a }
      end
    end

    # LOGGING IN
    def login
      @user = User.find_by(username: user_params[:username])

      if @user && @user.authenticate(user_params[:password])
        token = encode_token({ user_id: @user.id })
        @user.update(api_key: token)
        render json: @user.serial_hash
      else
        render json: { error: @user.errors.to_a }
      end
    end

    private

    def user_params
      params.permit(:username, :password, :email)
    end
  end
end
