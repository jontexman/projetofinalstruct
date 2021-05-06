class Api::V1::UserController < ApplicationController

    def login 
        if User.exists?(email: params[:email])

            user = User.find_by(email: params[:email])

            if user.valid_password?(params[:password])
                render json: user.as_json(only: %i[username email authentication_token])
            else
                head(status :unauthorazied)
            end
        else
            render json: {data:'ERROR',mesage:'Usuario nao existe'}, status: :not_found
        end
    end

    def create
        user = User.new(user_params)
        
        if user.save!
            render json: user, status: :created
        else
            render json: {data:'ERROR', mesage:'Falha ao criar o usario'}, status: :unprocessable_entity
            
        end

    end

    private
    
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)

    end
end