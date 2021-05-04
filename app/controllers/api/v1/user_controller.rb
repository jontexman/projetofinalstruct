class Api::V1::UserController < ApplicationController

    def sign_in
        user = User.find_by(email: params[:email])

        if user.valid_password?(params[:password])
            render json: user.as_json(only: %i[username email])
        else
            head(status :unauthorazied)
        end
    end
end